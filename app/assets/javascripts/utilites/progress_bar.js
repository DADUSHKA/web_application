document.addEventListener("turbolinks:load", function(){
  let startProgressBar = document.querySelector('.my-progressBar')
  if ( startProgressBar) {
    let valueProgressBar = document.querySelector('#progressBar').value
    let number_question = document.querySelector('.nuber-question').dataset.nuberQuestion
    let amount_questions = document.querySelector('.all-question').dataset.allQuestion

    let progressDivision =  Math.round(number_question * 100 / amount_questions)

     document.querySelector('#progressBar').value = valueProgressBar + progressDivision
  }
})


