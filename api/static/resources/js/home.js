// TODO: change these in local development
const API_URL = "https://api.tickoff.hu"
const LOGIN_URL = "https://tickoff.hu/"

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