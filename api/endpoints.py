from flask import Flask, request, make_response, abort, redirect
from time import sleep, time
from requests import session

from sqlalchemy import false
from schemas import success_response, todo_schema, user_schema
import config


import utils
from models import User, Session, Todo
from startup import app, db
import mailgun

def pswDigitCheck(psw):
    return any(char.isdigit() for char in psw)

def pswLowerCheck(psw):
    return any(letter.islower() for letter in psw)

def pswUpperCheck(psw):
    return any(letter.isupper() for letter in psw)


@app.route("/register", methods=["POST"])
def json_register():

    """
    Új felhasználó regisztrálása
    """

    (
        email,
        username,
        password,
        password_again,
        first_name,
        last_name,
        born_date,
    ) = utils.validate_json(
        "email",
        "username",
        "password",
        "password_again",
        "firstName",
        "lastName",
        "born_date",
    )

    # Bejövő értékek validálása

    # Vezetéknév nem lehet null
    if len(last_name) == 0:
        abort(400, "lastname can't be null")

    # Vezetéknév nem lehet null
    if len(first_name) == 0:
        abort(400, "firstname can't be null")

    # Az e-mail-cím nem lehet null
    if len(email) == 0:
        abort(400, "email can't be null")

    # A felhasználónév nem lehet null
    if len(username) == 0:
        abort(400, "username can't be null")

    # A jelszó nem elég hosszú
    if len(password) < 8:
        abort(400, "password length is too short")

    if not pswDigitCheck(password):
        abort(400, "password must contain a number")

    if not pswLowerCheck(password):
        abort(400, "password must contain lowercase")

    if not pswUpperCheck(password):
        abort(400, "password must contain uppercase")

    # A jelszó túl hosszú
    if len(password) > 60:
        abort(400, "password length is too long")

    # A születési dátum nem lehet null
    if born_date == 0:
        abort(400, "born date can't be null")

    # A két jelszó nem egyezik
    if password != password_again:
        abort(400, "the two password is not equal")

    if (len(first_name) or len(last_name) or len(email) or len(username)) > 100:
        abort(400, "too long input")

    # Csekk hogy használatban van-e az e-mail
    existing_user: User = User.query.filter_by(email=email).first()
    if existing_user is not None:
        abort(400, "email already in use")

    # Csekk hogy használatban van-e a username
    existing_user = User.query.filter_by(username=username).first()
    if existing_user is not None:
        abort(400, "username already in use")

    salt = utils.random_token()
    password_hash = utils.salted_hash(password, salt)
    admin = False

    email_verification_token = utils.random_token()

    user = User(
        register_date=int(time()),
        admin=admin,
        email=email,
        username=username,
        password_hash=password_hash,
        password_salt=salt,
        first_name=first_name,
        last_name=last_name,
        born_date=born_date,
        email_verification_token=email_verification_token,
    )

    db.session.add(user)
    db.session.commit()

    verification_url = (
        f"{config.API_URL}/verify-email?token={user.email_verification_token}"
    )

    mailgun.send_email_verification_email(
        recipient=user.email, first_name=user.first_name, url=verification_url
    )

    return success_response("successfully registered")


@app.route("/verify-email", methods=["GET"])
def json_verify_email():

    """
    Újonnan regisztrált email-cím megerősítése
    """

    email_verification_token = request.args.get("token")
    user: User = User.query.filter_by(
        email_verification_token=email_verification_token
    ).first()
    if user is None:
        abort(401)

    user.email_verification_token = None
    db.session.commit()

    return redirect(f"{config.APP_URL}/email_verified.html")


@app.route("/login", methods=["POST"])
def json_login():

    """
    Felhasználó bejelentkeztetése
    """

    email_or_username, password = utils.validate_json("email_or_username", "password")

    user: User = User.query.filter(
        (User.email == email_or_username) | (User.username == email_or_username)
    ).first()
    if user is None:
        abort(401)

    if user.email_verification_token is not None:
        abort(400, "email not verified")

    if not utils.check_password(password, user):
        abort(401, "wrong email or password")

    token = utils.random_token()

    token_hash = utils.salted_hash(token, config.SESSION_KEY_SALT)
    session = Session(user_id=user.id, token_hash=token_hash)
    db.session.add(session)
    db.session.commit()

    response = make_response(success_response("logged in successfully"))
    cookie_max_age = None
    response.set_cookie(
        key=config.SESSION_COOKIE_KEY,
        value=token,
        max_age=cookie_max_age,
        secure=False,
    )

    return response


@app.route("/password-reset-request", methods=["POST"])
def json_password_reset_request():

    """
    Új jelszó kérés elfelejtett jelszó esetén
    """

    email, = utils.validate_json("email")

    user: User = User.query.filter_by(email=email).first()

    token = utils.random_token()
    user.password_reset_token = token
    db.session.commit()

    verification_url = f"{config.API_URL}/password-reset?token={user.password_reset_token}"

    mailgun.send_password_reset_email(recipient=user.email, url=verification_url)

    return success_response("password reset sent to: " + user.email)


@app.route("/password-reset", methods=["GET"])
def json_password_reset():

    """
    Újonnan generált jelszó kiküldése e-mail-re
    """

    token = request.args.get("token")

    if token is None:
        abort(401)

    user: User = User.query.filter_by(password_reset_token=token).first()
    if user is None:
        abort(401)

    new_password = utils.random_password()
    new_password_hash = utils.salted_hash(new_password, user.password_salt)
    user.password_hash = new_password_hash
    db.session.commit()

    mailgun.send_new_password_email(recipient=user.email, new_password=new_password)
    return redirect(f"{config.APP_URL}/password_reset_completed.html")


@app.route("/logout", methods=["GET"])
def json_logout():

    """
    Kijelentkezteti a Felhasználót
    """

    session, user = utils.auth_session()

    db.session.delete(session)
    db.session.commit()

    response = make_response(success_response("logged out"))
    response.delete_cookie(key=config.SESSION_COOKIE_KEY)

    return response


@app.route("/todo", methods=["POST"])
def json_create_todo():

    """
    Létrehoz egy TODO-t
    Visszaadja az újonnan létrehozott TODO objektumot
    """

    session, user = utils.auth_session()

    todo_text, category_id, important, deadline = utils.validate_json("todo", "categoryID", "important", "deadline")

    todo_element = Todo(
        user_id=user.id,
        creation_date=int(time()),
        end_date=0,
        category_id=category_id,
        todo=todo_text,
        done=False,
        important=important,
        deadline=deadline
    )

    db.session.add(todo_element)
    db.session.commit()

    return success_response(todo_schema(todo_element))


@app.route("/todo", methods=["GET"])
def json_get_todos():

    """
    Visszaadja a felhasználó összes TODO objektumát
    """

    session, user = utils.auth_session()
    todos: "list[Todo]" = Todo.query.filter_by(user_id=user.id).all()
    return success_response([todo_schema(t) for t in todos])
    # így is lehet használni: map(todo_schema, todos)


@app.route("/todo", methods=["PATCH"])
def json_todo_change():
    # Todo módosítása

    session, user = utils.auth_session()

    todo_id,  = utils.validate_json("id")

    todo_done = request.json.get("done")
    todo_text = request.json.get("todoText")
    category_id = request.json.get("categoryID")
    important = request.json.get("important")

    todo: Todo = Todo.query.get(todo_id)

    if todo is None:
        abort(400, "invalid todo id")

    if todo.user_id != user.id:
        abort(401)

    if todo_done is not None:
        todo.done = todo_done
        if todo_done:
            todo.end_date = utils.utc_now()
        else:
            todo.end_date = None

    if category_id is not None:
        todo.category_id = category_id

    if todo_text is not None:
        todo.todo = todo_text

    if important is not None:
        todo.important = important


    db.session.commit()

    return success_response(todo_schema(todo))


@app.route("/todo", methods=["DELETE"])
def json_todo_delete():
    # Todo törlése

    session, user = utils.auth_session()

    todo_id, = utils.validate_json(
        "id"
    )

    todo: Todo = Todo.query.get(todo_id)

    if todo is None:
        abort(400, "invalid todo id")

    if todo.user_id != user.id:
        abort(401)
    

    db.session.delete(todo)
    db.session.commit()

    return success_response("todo successfully deleted")


# User adatokkal kapcsolatos endpoint-ok


@app.route("/profile-data", methods=["GET"])
def json_profile_data():
    session, user = utils.auth_session()

    return success_response(user_schema(user))


@app.route("/change-password", methods=["PATCH"])
def json_change_password():

    """
    Bejelentkezett felhasználó jelszavának módosítása
    """

    session, user = utils.auth_session()

    old_password, new_password, new_password_again = utils.validate_json(
        "oldPassword", "newPassword", "newPasswordAgain"
    )

    old_password_hash = utils.salted_hash(old_password, user.password_salt)

    if user.password_hash != old_password_hash:
        abort(401, "wrong password")

    if new_password != new_password_again:
        abort(400, "the two password is not equal")

    if len(old_password) == 0:
        abort(400, "old_password can't be empty")

    if len(new_password) == 0:
        abort(400, "new_password can't be empty")

    if len(new_password_again) == 0:
        abort(400, "new_password_again can't be empty")

    if len(new_password) < 8:
        abort(400, "password length is too short")

    if not pswDigitCheck(new_password):
        abort(400, "password must contain a number")

    if not pswLowerCheck(new_password):
        abort(400, "password must contain lowercase")

    if not pswUpperCheck(new_password):
        abort(400, "password must contain uppercase")


    new_password_hash = utils.salted_hash(new_password, user.password_salt)

    user.password_hash = new_password_hash
    db.session.commit()

    return success_response("password changed successfully")


@app.route("/change-username", methods=["PATCH"])
def json_change_username():

    """
    Bejelentkezett felhasználó felhasználónevének módosítása
    """

    session, user = utils.auth_session()

    password, new_username = utils.validate_json("password", "newUsername")

    new_password_hash = utils.salted_hash(password, user.password_salt)

    if user.password_hash != new_password_hash:
        abort(401, "wrong password")

    # Csekk hogy használatban van-e a username
    existing_user = User.query.filter_by(username=new_username).first()
    if existing_user is not None:
        abort(400, "a felhasználónév már foglalt")

    if len(password) > 60:
        abort(400, "password length is too long")

    if len(new_username) == 0:
        abort(400, "username can't be empty")

    user.username = new_username

    db.session.commit()

    return success_response("username changed successfully")


@app.route("/change-data", methods=["PATCH"])
def json_change_data():

    """
    Bejelentkezett felhasználó adatainak módosítása
    """

    session, user = utils.auth_session()
    new_first_name, new_last_name, new_born_date = utils.validate_json(
        "newFirstName", "newLastName", "newBornDate"
    )
    

    if len(new_first_name) == 0:
        user.first_name = user.first_name
    else:
        user.first_name = new_first_name

    if len(new_last_name) == 0:
        user.last_name = user.last_name
    else:
        user.last_name = new_last_name

    if new_born_date == 0:
        user.born_date = user.born_date
    else:
        user.born_date = new_born_date
    

    db.session.commit()

    return success_response("data changed successfully")


# ADMIN ASZTALI ALKALMAZÁS ÁLTAL HASZNÁLT ENDPOINT

@app.route("/all-user", methods=["GET"])
def json_get_all_user():
    session, user = utils.auth_session()


    if user.admin:
        users: "list[User]" = User.query.all()
        return success_response([user_schema(u) for u in users])
    else:
        abort(401, "permission denied")

    
@app.route("/all-todo", methods=["GET"])
def json_get_all_todo():
    session, user = utils.auth_session()


    if user.admin:
        todos: "list[Todo]" = Todo.query.all()
        return success_response([todo_schema(t) for t in todos])
    else:
        abort(401, "permission denied")
    
@app.route("/delete-user", methods=["DELETE"])
def json_delete_user():
    session, user = utils.auth_session()
    user_id, = utils.validate_json(
        "id"
    )
    user_to_be_deteled: User = User.query.get(user_id)

    if user is None:
        abort(400, "invalid user id")
    
    if user.admin:
        db.session.delete(user_to_be_deteled)
        db.session.commit()
        return success_response("User deleted")
    
    else:
        abort(401, "permission denied")


    