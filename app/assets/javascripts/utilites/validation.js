document.addEventListener("turbolinks:load", function() {
  var password = document.querySelector("#user_password_confirmation");
  if (password) {
    password.addEventListener("input", validPasswd);
  }
});

function validPasswd() {
  var password1 = document.getElementById("user_password");
  var password2 = document.getElementById("user_password_confirmation");

  if (password1.value != password2.value) {
   password2.style.backgroundColor = "red";
  } else {
    password2.style.backgroundColor = "green";
  }

  if (password2.value.length == 0) {
    password2.style.backgroundColor = '#fff';
  }
}

