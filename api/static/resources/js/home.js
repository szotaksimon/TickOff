// TODO: change these in local development
const API_URL = "http://localhost:5000"
const LOGIN_URL = "http://127.0.0.1:5500/frontend/login.html"
const profil_div = document.getElementById("profil")
const change_username_div = document.getElementById("change-username-div")
const change_password_div = document.getElementById("change-password-div")
const change_data_div = document.getElementById("change-data-div")
const toast = document.getElementById("snackbar")
let user
let slideProfil = true
let slideUsername = true
let slidePassword = true
let slideData = true

window.addEventListener('load', (event) => {
    profilData()

})
document.getElementById("profil-button").addEventListener("click", showProfileField)
document.getElementById("new-username-ok-button").addEventListener("click", changeUsername)
document.getElementById("new-password-ok-button").addEventListener("click", changePassword)
document.getElementById("new-data-ok-button").addEventListener("click", changeData)


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
    if (slideProfil) {
        document.getElementById("lastname").innerHTML = ""
        document.getElementById("firstname").innerHTML = ""
        document.getElementById("email").innerHTML = ""
        document.getElementById("borndate").innerHTML = ""
        document.getElementById("registerdate").innerHTML = ""

        profil_div.className = "slideInProfil"
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

        slideProfil = false
    } else {
        profil_div.className = "slideOutProfil"
        slideProfil = true
    }
}

function showUsernameChangeDiv() {
    if (slideUsername) {
        change_username_div.className = "slideInUsername"
        slideUsername = false
    } else {
        change_username_div.className = "slideOutUsername"
        slideUsername = true
    }
}

function showPasswordChangeDiv() {
    if (slidePassword) {
        change_password_div.className = "slideInPassword"
        slidePassword = false
    } else {
        change_password_div.className = "slideOutPassword"
        slidePassword = true
    }
}

function showDataChangeDiv() {
    if (slideData) {
        change_data_div.className = "slideInData"
        slideData = false
    } else {
        change_data_div.className = "slideOutData"
        slideData = true
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


async function changeUsername() {
    const formValues = getFormValues()
    const { result, json } = await changeUsernameRequest()
    if (result.status === 200) {
        console.log(result)
        await profilData()
    } else if (formValues.password.length == 0 || formValues.newUsername.length == 0) {
        toast.className = "show"
        toast.innerHTML = "A mezők kitöltése kötelező!"
        setTimeout(function() { toast.className = toast.className.replace("show", ""); }, 3000);
    }

}
async function changeUsernameRequest() {
    const formValues = getFormValues()
    const result = await fetch(API_URL + "/change-username", {
        method: "PATCH",
        credentials: "include",
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify(formValues),
    });

    const json = await result.json()
    document.getElementById("new-username").value = ""
    document.getElementById("password-username").value = ""


    return { result, json }
}



async function changePassword() {
    const { result, json } = await changePasswordRequest()
    if (result.status === 200) {
        console.log(result)
    } else if (formValues.oldPassword.length == 0 || formValues.newPassword.length == 0 || formValues.newPasswordAgain.length == 0) {
        toast.className = "show"
        toast.innerHTML = "A mezők kitöltése kötelező!"
        setTimeout(function() { toast.className = toast.className.replace("show", ""); }, 3000);
    }

}
async function changePasswordRequest() {
    const formValues = getFormValues()
    const result = await fetch(API_URL + "/change-password", {
        method: "PATCH",
        credentials: "include",
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify(formValues),
    });

    const json = await result.json()

    document.getElementById("old-password").value = ""
    document.getElementById("new-password").value = ""
    document.getElementById("new-password-again").value = ""

    return { result, json }
}


async function changeData() {
    const { result, json } = await changeDataRequest()
    if (result.status === 200) {
        console.log(result)
        await profilData()
        await showProfileField()
    } else if (formValues.newLastName.length == 0 || formValues.newFirstName.length == 0 || formValues.newBornDate == 0) {
        toast.className = "show"
        toast.innerHTML = "A mezők kitöltése kötelező!"
        setTimeout(function() { toast.className = toast.className.replace("show", ""); }, 3000);
    }

}
async function changeDataRequest() {
    const formValues = getFormValues()
    const result = await fetch(API_URL + "/change-data", {
        method: "PATCH",
        credentials: "include",
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify(formValues),
    });

    const json = await result.json()

    document.getElementById("new-first").value = ""
    document.getElementById("new-last").value = ""
    document.getElementById("new-born").value = ""

    return { result, json }
}


function getFormValues() {
    const password = document.getElementById("password-username").value
    const oldPassword = document.getElementById("old-password").value
    const newPassword = document.getElementById("new-password").value
    const newPasswordAgain = document.getElementById("new-password-again").value
    const newUsername = document.getElementById("new-username").value
    const newFirstName = document.getElementById("new-first").value
    const newLastName = document.getElementById("new-last").value
    const bornDate = document.getElementById("new-born").value
    const newBornDate = Math.floor(new Date(bornDate).getTime() / 1000);
    return {
        password,
        newUsername,
        oldPassword,
        newPassword,
        newPasswordAgain,
        newFirstName,
        newLastName,
        newBornDate
    }
}