from flask import render_template, url_for, redirect
from startup import app
from models import Todo, User, Category
import utils
import config
import schemas


def get_static_url(file: str):
    return url_for('static', filename=file)


def get_todos_by_view(user: User, view: str) -> "list[Todo]":
    all: "list[Todo]" = Todo.query.filter_by(user_id=user.id).all()


    if view == "day":
        start, end = utils.utc_today()
        return [t for t in all if not t.done and t.deadline >= start and t.deadline <= end]

    if view == "week":
        start, end = utils.utc_week()
        return [t for t in all if not t.done and t.deadline >= start and t.deadline <= end]

    if view == "done":
        return [t for t in all if t.done]
    
    if view == "important":
        return [t for t in all if not t.done and t.important]
    
    if view == "postponed":
        now = utils.utc_now()
        return  [t for t in all if not t.done and now > t.deadline and not t.done]
    
    return all


@app.route('/home/<string:view>', methods=["GET"])
def home_page(view: str):
    session, user = utils.auth_session(auto_abort=False)

    if user is None:
        return redirect(f"{config.APP_URL}/login.html")

    categories = [schemas.category_schema(c) for c in Category.query.all()]

    todos = [schemas.todo_schema(t) for t in get_todos_by_view(user, view)]

    return render_template("home.html", todos=todos, categories=categories, view=view, url=get_static_url)