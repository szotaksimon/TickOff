function showToast(message, success = false) {
    const toast = document.getElementById("snackbar")
    toast.className = success ? "show success" : "show"
    toast.innerHTML = message
    setTimeout(function(){ toast.className = toast.className.replace("show", ""); }, 3000);
}

const editTodo = {

    async delete(id) {
        const result = await fetch(window.API_URL + "/todo", {
            method: "DELETE",
            credentials: "include",
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify({id})
        })
        if(result.status !== 200) {
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
            body: JSON.stringify({id, done: true})
        })
        if(result.status !== 200) {
            showToast("Hiba történt!")
        } else {
            window.location.reload()
        }
    }

}