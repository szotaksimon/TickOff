const API = "https://api.tickoff.hu";

const toast = document.getElementById("snackbar");

async function register() {
  const formValues = getFormValues();
  const { result, json } = await sendRegisterRequest();
  if (result.status === 200) {
    window.location.replace("success_register.html");
  } else if (json["data"] === "email already in use") {
    toast.className = "show";
    toast.innerHTML = "Ez az e-mail-cím már foglalt!";
    setTimeout(function () {
      toast.className = toast.className.replace("show", "");
    }, 3000);
  } else if (json["data"] === "username already in use") {
    toast.className = "show";
    toast.innerHTML = "Ez a felhasználónév már foglalt!";
    setTimeout(function () {
      toast.className = toast.className.replace("show", "");
    }, 3000);
  }

  if (formValues.lastName.length == 0) {
    toast.className = "show";
    toast.innerHTML = "A vezetéknév megadása kötelező!";
    setTimeout(function () {
      toast.className = toast.className.replace("show", "");
    }, 3000);
  } else if (formValues.firstName.length == 0) {
    toast.className = "show";
    toast.innerHTML = "A keresztnév megadása kötelező!";
    setTimeout(function () {
      toast.className = toast.className.replace("show", "");
    }, 3000);
  } else if (formValues.email.length == 0) {
    toast.className = "show";
    toast.innerHTML = "Az e-mail-cím megadása kötelező!";
    setTimeout(function () {
      toast.className = toast.className.replace("show", "");
    }, 3000);
  } else if (formValues.username.length == 0) {
    toast.className = "show";
    toast.innerHTML = "A felhasználónév megadása kötelező!";
    setTimeout(function () {
      toast.className = toast.className.replace("show", "");
    }, 3000);
  } else if (formValues.password.length == 0) {
    toast.className = "show";
    toast.innerHTML = "A jelszó megadása kötelező!";
    setTimeout(function () {
      toast.className = toast.className.replace("show", "");
    }, 3000);
  } else if (formValues.password.length > 60) {
    toast.className = "show";
    toast.innerHTML = "A jelszó nem lehet hosszabb 60 karakternél!";
    setTimeout(function () {
      toast.className = toast.className.replace("show", "");
    }, 3000);
  } else if (formValues.password.length < 8) {
    toast.className = "show";
    toast.innerHTML = "A jelszó nem lehet rövidebb 8 karakternél!";
    setTimeout(function () {
      toast.className = toast.className.replace("show", "");
    }, 3000);
  } else if (formValues.password != formValues.password_again) {
    toast.className = "show";
    toast.innerHTML = "A két jelszó nem egyezik!";
    setTimeout(function () {
      toast.className = toast.className.replace("show", "");
    }, 3000);
  } else if (formValues.born === null) {
    toast.className = "show";
    toast.innerHTML = "A születési dátum megadása kötelező!";
    setTimeout(function () {
      toast.className = toast.className.replace("show", "");
    }, 3000);
  }

  // if(formValues.password.search[/a-z/i] < 1){
  //     toast.className = "show"
  //     toast.innerHTML = "A jelszónak tartalmaznia kell kis és nagybetűket, valamint számot."
  //     setTimeout(function(){ toast.className = toast.className.replace("show", ""); }, 3000);
  // }
}

function jelszoErosseg() {
  const jelszo = document.getElementById("jelszo-input").value;
  let szelesseg = jelszo.length;
  if (jelszo.length < 4) {
    document.getElementById("jelszo-erosseg").style.width =
      szelesseg * 2.5 + "rem";
    document.getElementById("jelszo-erosseg").style.backgroundColor = "red";
  } else if (jelszo.length >= 4 && jelszo.length < 8) {
    document.getElementById("jelszo-erosseg").style.width =
      szelesseg * 2.5 + "rem";
    document.getElementById("jelszo-erosseg").style.backgroundColor = "orange";
  } else if (jelszo.length >= 8 && jelszo.length < 10) {
    document.getElementById("jelszo-erosseg").style.width =
      szelesseg * 2.5 + "rem";
    document.getElementById("jelszo-erosseg").style.backgroundColor = "green";
  }
}

async function sendRegisterRequest() {
  const formValues = getFormValues();
  const result = await fetch(API + "/register", {
    method: "POST",
    credentials: "include",
    headers: {
      "Content-Type": "application/json",
    },
    body: JSON.stringify(formValues),
  });

  const json = await result.json();

  return { result, json };
}

function getFormValues() {
  const lastName = document.getElementById("vezeteknev-input").value;
  const firstName = document.getElementById("keresztnev-input").value;
  const email = document.getElementById("email-input").value;
  const username = document.getElementById("felhasznalo-input").value;
  const password = document.getElementById("jelszo-input").value;
  const password_again = document.getElementById("jelszo-megint-input").value;
  const born = document.getElementById("szuletes-input").value;
  const born_date = Math.floor(new Date(born).getTime() / 1000);
  return {
    email,
    username,
    lastName,
    firstName,
    password,
    password_again,
    born_date,
  };
}

const togglePassword = document.querySelector("#togglePassword");
const password = document.querySelector("#jelszo-input");

togglePassword.addEventListener("click", function (e) {
  // toggle the type attribute
  const type =
    password.getAttribute("type") === "password" ? "text" : "password";
  password.setAttribute("type", type);
  // toggle the eye slash icon
  this.classList.toggle("fa-eye-slash");
});
