const API_URL = "http://localhost:5000"
const LOGIN_URL = "http://localhost:5500/frontend/login.html"

async function logout() {
    await sendLogoutRequest()
    window.location.replace(LOGIN_URL)
}

function navigationButton(view) {
    window.location.replace(`http://localhost:5000/home/${view}`)
}

async function sendLogoutRequest() {

    const result = await fetch(API_URL + "/logout", {
        method: "GET",
        credentials: "include",
    })

    return { result }
}