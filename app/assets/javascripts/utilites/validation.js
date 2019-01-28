document.addEventListener('turbolinks:load', function () {
  var control = document.querySelector('.sort-by-title')
  var password = document.querySelector('#user_password_confirmation')
  if (password) {password.addEventListener('input', validPasswd)}
})

function validPasswd() {
  var password1 = document.getElementById("user_password")
  var password2 = document.getElementById("user_password_confirmation")
  console.log( password1.value)
  console.log( password2.value.length)
  if(password1.value != password2.value) {
  if (password2.value.length > 0) {document.getElementById("user_password_confirmation").style.backgroundColor = "red"}
  } else {
    document.getElementById("user_password_confirmation").style.backgroundColor = "green"
  }
}