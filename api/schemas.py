from models import Todo, User


def success_response(data):
    return {"result": "ok", "data": data}


def error_response(data):
    return {"result": "error", "data": data}


def todo_schema(todo: Todo):
    return {
        "id": todo.id,
        "user_id": todo.user_id,
        "category_id": todo.category_id,
        "creation_date": todo.creation_date,
        "end_date": todo.end_date,
        "todo": todo.todo,
        "done": todo.done,
        "important": todo.important,
        "deadline": todo.deadline,
    }


def user_schema(user: User):
    return {
        "id": user.id,
        "username": user.username,
        "email": user.email,
        "first_name": user.first_name,
        "last_name": user.last_name,
        "born_date": user.born_date,
        "register_date": user.register_date,
    }
