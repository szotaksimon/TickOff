// TODO: change these in local development
const API_URL = "http://localhost:5000"
const LOGIN_URL = "http://127.0.0.1:5500/frontend/login.html"
const profil_div = document.getElementById("profil")
let user
let slide = true

window.addEventListener('load', (event) => {
    profilData()

})
document.getElementById("profil-button").addEventListener("click", showProfileField)


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




async function showProfileField() {
    if (slide) {
        document.getElementById("lastname").innerHTML = ""
        document.getElementById("firstname").innerHTML = ""
        document.getElementById("email").innerHTML = ""
        document.getElementById("borndate").innerHTML = ""
        document.getElementById("registerdate").innerHTML = ""

        profil_div.className = "slideIn"
        document.getElementById("lastname").innerHTML += user.data.last_name
        document.getElementById("firstname").innerHTML += user.data.first_name
        document.getElementById("email").innerHTML += user.data.email
        let born_date = new Date(user.data.born_date * 1000)
        let year = born_date.getFullYear()
        let month = born_date.getMonth() + 1
        let day = born_date.getDay()
        document.getElementById("borndate").innerHTML += year + "." + month + "." + day + "."
        let register_date = new Date(user.data.register_date * 1000)
        year = register_date.getFullYear()
        month = register_date.getMonth() + 1
        day = register_date.getDay()
        document.getElementById("registerdate").innerHTML += year + "." + month + "." + day + "."

        slide = false
    } else {
        profil_div.className = "slideOut"
        slide = true
    }






}


async function profilData() {
    const { result } = await profilDataRequeset()
    if (result.status === 200) {
        user = await result.json()
        document.getElementById("username").innerHTML = user.data.username
    }

}



async function profilDataRequeset() {
    const result = await fetch(API_URL + "/profile-data", {
        method: "GET",
        credentials: "include",
    })
    return { result }
}