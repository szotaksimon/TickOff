const toast = document.getElementById("snackbar")
const pass_reset_div = document.getElementById("password-reset-div")
const pass_reset_link = document.getElementById("forgot-password-link")


async function login() {
    const formValues = getFormValues()
    const {result, json} = await sendLoginRequest()
    if(result.status === 200) {
        window.location.replace(window.API_URL + "/home/day")
    } 
    if (json["data"] === "email not verified") {
        toast.className = "show"
        toast.innerHTML = "Az e-mail-cím nincs megerősítve."
        setTimeout(function(){ toast.className = toast.className.replace("show", ""); }, 3000);
        
    }
    if (json["data"] === "wrong email or password") {
        toast.className = "show"
        toast.innerHTML = "Hibás e-mail-cím, vagy jelszó."
        setTimeout(function(){ toast.className = toast.className.replace("show", ""); }, 3000);
    }
    
    if(formValues.email_or_username.length == 0 || formValues.password.length == 0){
        toast.className = "show"
        toast.innerHTML = "A mezők kitöltése kötelező!"
        setTimeout(function(){ toast.className = toast.className.replace("show", ""); }, 3000);
    }

}



async function sendLoginRequest() {

    const formValues = getFormValues()
    const result = await fetch(window.API_URL + "/login", {
        method: "POST",
        credentials: "include",
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify(formValues)
    })

    const json = await result.json()

    return {result, json}
}

async function passwordResetRequest(){
    const formValues = getFormValues()
    const {result, json} = await sendPasswordResetRequest()
    if(result.status === 200) {
        window.location.replace("password_reset_success.html")
    } else if(formValues.email.length == 0){
        toast.className = "show"
        toast.innerHTML = "A mező kitöltése kötelező!"
        setTimeout(function(){ toast.className = toast.className.replace("show", ""); }, 3000);
    }
}

async function sendPasswordResetRequest() {

    const formValues = getFormValues()
    const result = await fetch(window.API_URL + "/password-reset-request", {
        method: "POST",
        credentials: "include",
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify({email: formValues.email})
    })

    const json = await result.json()

    return {result, json}
}

function getFormValues(){
    const email_or_username = document.getElementById("email-vagy-felhasznalo-input").value
    const password = document.getElementById("jelszo-input").value
    const email = document.getElementById("password-reset-input").value
    return {
        email_or_username, password, email
    }
}


function showPasswordResetField(){
    pass_reset_div.className = "show-div"
    setTimeout(function(){ pass_reset_link.className = pass_reset_link.className.replace("", "hide-link"); });
}
