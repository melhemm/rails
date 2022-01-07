document.addEventListener('turbolinks:load', () => {
  const controls = document.querySelectorAll('.form-inline-link')
  if (controls.length) {
    for (let i = 0; i < controls.length; i++) {
      controls[i].addEventListener('click', formInlineLinkHandler)
    }
  }

  const errors = document.querySelector('.resource-errors')

  if (errors) {
    const resourceId = errors.dataset.resourceId
    formInlineHandler(resourceId)
  }
})

function formInlineLinkHandler(e) {
  e.preventDefault()

  let testId = this.dataset.testId
  formInlineHandler(testId)
}

function formInlineHandler(testId) {
  const dataAtrr = `[data-test-id="${testId}"]`
  const link = document.querySelector(`.form-inline-link${dataAtrr}`)
  const testTitle = document.querySelector(`.test-title${dataAtrr}`)
  const formInline = document.querySelector(`.form-inline${dataAtrr}`)

  if (formInline.classList.contains('hide')) {
    testTitle.classList.add('hide')
    formInline.classList.remove('hide')
    link.textContent = link.dataset.cancel
  } else {
    testTitle.classList.remove('hide')
    formInline.classList.add('hide')
    link.textContent = link.dataset.edit
  }
}
