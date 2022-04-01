const API = "https://api.tickoff.hu"

async function logout() {
    await sendLogoutRequest()
    window.location.replace("login.html")
}

function navigationButton(view) {
    window.location.replace(`http://localhost:5000/home/${view}`)
}

async function sendLogoutRequest() {

    const result = await fetch(API + "/logout", {
        method: "GET",
        credentials: "include",
    })

    return { result }
}