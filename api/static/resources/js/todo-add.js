function showToast(message, success = false) {
    const toast = document.getElementById("snackbar")
    toast.className = success ? "show success" : "show"
    toast.innerHTML = message
    setTimeout(function(){ toast.className = toast.className.replace("show", ""); }, 3000);
}

const newTodo = {

    important: false,

    toggleImportant() {
        this.important = !this.important
        const indicator = document.querySelector("#todo-add-important")
        if (indicator) {
            indicator.setAttribute("title", this.important ? "Megjelölés nem fontosként" : "Megjelölés fontosként")
            indicator.innerHTML = this.important ? '🤩' : '😴'
        }
    },

    validate() {

        const todoText = document.querySelector("#todo-add-title").value
        if(todoText.length === 0) {
            showToast("Add meg a feladat leírását!")
            return
        }

        const categoryID = document.querySelector("#todo-add-category").value

        const deadline = document.querySelector("#todo-add-deadline").value
        if(deadline === "") {
            showToast("Add meg a feladat határidejét!")
            return
        }

        return {
            todo: todoText,
            categoryID: categoryID,
            important: this.important,
            deadline: Math.floor(new Date(deadline).getTime() / 1000),
        }
    },

    async create() {
        const data = this.validate()
        if(data) {
            const result = await fetch(window.API_URL + "/todo", {
                method: "POST",
                credentials: "include",
                headers: {
                    "Content-Type": "application/json"
                },
                body: JSON.stringify(data)
            })
            if(result.status !== 200) {
                showToast("Hiba történt!")
            } else {
                window.location.reload()
            }
        }
    }

}