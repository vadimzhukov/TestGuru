document.addEventListener('turbolinks:load',  function() {
  let editControl = document.querySelectorAll('.edit-btn')

  if (editControl) {
    for (let i = 0; i < editControl.length; i++) {
      editControl[i].addEventListener('click', startEdit)
    }
  }

  let error = document.querySelector('.resource-errors')

  if (error) {
    let resourceId = error.dataset.resourceId
    formInlineHandler(resourceId)
  }
})

function startEdit(event) {
  event.preventDefault()
  let testId = this.dataset.testId
  
  formInlineHandler(testId)
}

function formInlineHandler(testId) {
  let testTitle = document.querySelector(`.test-title[data-test-id="${testId}"]`)
  let editBtn = document.querySelector(`.edit-btn[data-test-id="${testId}"]`)
  let formInline = document.querySelector(`.form-inline[data-test-id="${testId}"]`)

  if (formInline.classList.contains('hide')) {
    testTitle.classList.add('hide')
    editBtn.classList.add('hide')
    formInline.classList.remove('hide')
  } else {
    testTitle.classList.remove('hide')
    editBtn.classList.remove('hide')
    formInline.classList.add('hide')
  }
}
