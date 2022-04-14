function showToast(message, success = false) {
    const toast = document.getElementById("snackbar")
    toast.className = success ? "show success" : "show"
    toast.innerHTML = message
    setTimeout(function() { toast.className = toast.className.replace("show", ""); }, 3000);
}


const editTodo = {

    async delete(id) {
        const result = await fetch(window.API_URL + "/todo", {
            method: "DELETE",
            credentials: "include",
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify({ id })
        })
        if (result.status !== 200) {
            showToast("Hiba történt!")
        } else {
            window.location.reload()
        }
    },

    async setDone(id) {
        const result = await fetch(window.API_URL + "/todo", {
            method: "PATCH",
            credentials: "include",
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify({ id, done: true })
        })
        if (result.status !== 200) {
            showToast("Hiba történt!")
        } else {
            window.location.reload()
        }
    },

    validate(id) {

        const todoText = document.querySelector(`#todo-edit-title-${id}`).value
        if (todoText.length === 0) {
            showToast("Add meg a feladat leírását!")
            return
        }

        const categoryID = document.querySelector(`#todo-edit-category-${id}`).value
        const important = document.querySelector(`#todo-edit-important-${id}`).innerHTML === '🤩'

        return {
            id,
            todoText,
            categoryID: parseInt(categoryID),
            important: important,
        }
    },


    toggleImportant(id) {
        const indicator = document.querySelector(`#todo-edit-important-${id}`)
        const important = indicator.innerHTML === '🤩'
        if (indicator) {
            indicator.setAttribute("title", !important ? "Megjelölés nem fontosként" : "Megjelölés fontosként")
            indicator.innerHTML = !important ? '🤩' : '😴'
            this.edit(id)
        }
    },

    async edit(id) {
        const data = this.validate(id)
        if (data) {
            const result = await fetch(window.API_URL + "/todo", {
                method: "PATCH",
                credentials: "include",
                headers: {
                    "Content-Type": "application/json"
                },
                body: JSON.stringify(data)
            })
            if (result.status !== 200) {
                showToast("Hiba történt!")
            } else {
                window.location.reload()
            }
        }
    }
}