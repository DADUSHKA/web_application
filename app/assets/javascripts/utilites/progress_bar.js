document.addEventListener("turbolinks:load", function(){
  let startProgressBar = document.querySelector('.my-progressBar')
  if ( startProgressBar) {
    let controllScroll = document.querySelector('#progressBar').value
    let number = document.querySelector('.nuber-question').dataset.nuberQuestion
    let numbers = document.querySelector('.all-question').dataset.allQuestion

    let division = Math.round(100 / numbers)
    let progressDivision =  Math.round(number * division)

    document.querySelector('#progressBar').value = controllScroll + progressDivision
  }
})
