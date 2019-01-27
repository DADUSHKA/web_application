document.addEventListener('turbolinks:load', function () {
  var control = document.querySelector('.sort-by-title')
  if (control) {control.addEventListener('click', sortRowsByTitle)}

    var password = document.querySelector('#user_password_confirmation')
  if (password) {password.addEventListener('input', validPasswd)}
})

function validPasswd() {
  var password1 = document.getElementById("user_password")
  var password2 = document.getElementById("user_password_confirmation")
  if(password1.value != password2.value) {
    document.getElementById("user_password_confirmation").style.backgroundColor = "red"
  } else {
    document.getElementById("user_password_confirmation").style.backgroundColor = "green"
  }
}

function sortRowsByTitle() {
  var table = document.querySelector('table')
  var rows = table.querySelectorAll('tr')
  var sortedRows = []

  for(var i = 1; i < rows.length; i++) {
    sortedRows.push(rows[i])
  }

  if (this.querySelector('.octicon-arrow-up').classList.contains('hide')) {
    sortedRows.sort(compareRowsAsc)
    this.querySelector('.octicon-arrow-up').classList.remove('hide')
    this.querySelector('.octicon-arrow-down').classList.add('hide')
  } else {
    sortedRows.sort(compareRowsDesc)
    this.querySelector('.octicon-arrow-up').classList.add('hide')
    this.querySelector('.octicon-arrow-down').classList.remove('hide')
  }

  var sortedTable = document.createElement('table')

  sortedTable.classList.add('table')
  sortedTable.appendChild(rows[0])

  for (var i = 0; i < sortedRows.length; i++) {
    sortedTable.appendChild(sortedRows[i])
  }

  table.parentNode.replaceChild(sortedTable, table)
}

function compareRowsAsc(row1, row2) {
  var testTitle1 = row1.querySelector('td').textContent
  var testTitle2 = row2.querySelector('td').textContent

  if (testTitle1 < testTitle2) { return -1 }
    if (testTitle1 > testTitle2) { return 1 }
      return 0
  }

function compareRowsDesc(row1, row2) {
  var testTitle1 = row1.querySelector('td').textContent
  var testTitle2 = row2.querySelector('td').textContent

  if (testTitle1 < testTitle2) { return 1 }
    if (testTitle1 > testTitle2) { return -1 }
      return 0
  }
















// function Complete1()
//         {
//             if(document.Sel3.Pwd.value==document.Sel3.Pwd1.value)
//                 alert("Вас зарегистрировали\nID="+document.Sel3.Id.value+"\nPassword="+document.Sel3.Pwd.value);
//             else
//                 alert("Ошибка при вводе пароля\nПопробуйте еще раз");
//         }



// document.addEventListener('DOMContentLoaded', function () {
//             var pass1 = document.querySelector('#user_password'),
//                 pass2 = document.querySelector('#user_password_confirmation')
//             pass1.addEventListener('input', function () {
//                 this.value != pass2.value ? pass2.setCustomValidity('Password incorrect') : pass2.setCustomValidity('')
//             })
//             pass2.addEventListener('input', function (e) {
//                 this.value != pass1.value ? this.setCustomValidity('Password incorrect') : this.setCustomValidity('')
//             })
//         })


 // document.addEventListener('turbolinks:load', function() {
 //    var form = document.querySelector('.new_user'),
 //    pas = form.querySelectorAll('#user_password, #user_password_confirmation');

 //    form.addEventListener('submit', function(e) {
 //      var err = !(pas[0].value && (pas[0].value ==  pas[1].value))
 //      pas[1].setAttribute("title", err ? 'err' : '');

 //      err && e.preventDefault();

 //    }, false);

 //    pas[1].addEventListener('input', function(e) {
 //      var err = !(pas[0].value ==  pas[1].value)
 //      pas[1].setAttribute("title", err ? 'err' : '');

 //    }, false);

 //  });
