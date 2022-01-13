document.addEventListener('turbolinks:load', () => {
  const formInput = document.querySelector(".register-user");
  if (formInput) {
    const paswd = document.getElementById('user_password')
    const confirm_paswd = document.getElementById('user_password_confirmation')
    formInput.addEventListener('input', () => checkpassword(paswd, confirm_paswd));
  }
})

const checkpassword = (paswd, confirm_paswd) => { 
  if (paswd.value !== confirm_paswd.value) {
    confirm_paswd.parentNode.querySelector('.octicon-shield-x').classList.remove('hide');
    confirm_paswd.parentNode.querySelector('.octicon-shield-check').classList.add('hide');
  } else {
    confirm_paswd.parentNode.querySelector('.octicon-shield-x').classList.add('hide');
    confirm_paswd.parentNode.querySelector('.octicon-shield-check').classList.remove('hide');
  }

  if (!confirm_paswd.value) {
    confirm_paswd.parentNode.querySelector('.octicon-shield-x').classList.add('hide');
    confirm_paswd.parentNode.querySelector('.octicon-shield-check').classList.add('hide');
    return;
  }
}
