document.addEventListener('turbolinks:load', () => {
  let control = document.querySelector('.sort-by-title')
  control.addEventListener('click', () => {
    alert('Clicked')
  })
})
alert('Clicked')