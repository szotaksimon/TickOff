from flask import render_template, url_for, redirect
from startup import app
from models import Todo, User
import utils
import config
import schemas


def get_static_url(file: str):
    return url_for('static', filename=file)


def get_todos_by_view(user: User, view: str) -> "list[Todo]":
    all: "list[Todo]" = Todo.query.filter_by(user_id=user.id).all()


    if view == "day":
        start, end = utils.utc_today()
        return [t for t in all if t.creation_date >= start and t.creation_date <= end]

    if view == "week":
        start, end = utils.utc_week()
        return [t for t in all if t.creation_date >= start and t.creation_date <= end]

    if view == "done":
        return [todo for todo in all if todo.done]
    
    return all


@app.route('/home/<string:view>', methods=["GET"])
def home_page(view: str):
    session, user = utils.auth_session(auto_abort=False)

    # hack: remote this
    user = User.query.filter_by(username="admin").first()

    if user is None:
        return redirect(config.APP_LOGIN_URL)

    todos = [schemas.todo_schema(t) for t in get_todos_by_view(user, view)]

    return render_template("home.html", todos=todos, view=view, url=get_static_url)