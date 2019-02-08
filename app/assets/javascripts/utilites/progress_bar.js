document.addEventListener("turbolinks:load", function(){
  var startProgressBar = document.querySelector('.my-progressBar')
  if ( startProgressBar) {
    var valueProgressBar = document.querySelector('#progressBar').value
    var number_question = document.querySelector('.nuber-question').dataset.nuberQuestion
    var amount_questions = document.querySelector('.all-question').dataset.allQuestion

    var progressDivision =  Math.round(number_question * 100 / amount_questions)

     document.querySelector('#progressBar').value = valueProgressBar + progressDivision
  }
})


