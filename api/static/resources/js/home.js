// TODO: change these in local development
const API_URL = "http://localhost:5000"
const LOGIN_URL = "http://127.0.0.1:5500/frontend/login.html"
const profil_div = document.getElementById("profil")

async function logout() {
    await sendLogoutRequest()
    window.location.replace(LOGIN_URL)
}

function navigationButton(view) {
    window.location.replace(`${API_URL}/home/${view}`)
}

async function sendLogoutRequest() {

    const result = await fetch(API_URL + "/logout", {
        method: "GET",
        credentials: "include",
    })

    return { result }
}


function showProfileField() {
    profil_div.className = "slideIn"

}