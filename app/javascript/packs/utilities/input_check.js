document.addEventListener("turbolinks:load", function() {
  let passwordConfirmInput = document.querySelector('.check-input-valid');
  let passwordInput = document.querySelector('.password-input');
  let passwordConfirmationErrorMessage = document.getElementById('validationPasswordFeedback');


  if (passwordConfirmInput) {
    passwordConfirmInput.addEventListener('input', () => {
    let password = passwordInput.value
    let passwordConfirmation = passwordConfirmInput.value
      if (passwordConfirmation != password) {
        passwordConfirmInput.classList.add('is-invalid')
        passwordConfirmationErrorMessage.classList.remove('hide');
      }
      else {
        passwordConfirmationErrorMessage.classList.add('hide');
        passwordConfirmInput.classList.remove('is-invalid');
      }
    })
  }
})
