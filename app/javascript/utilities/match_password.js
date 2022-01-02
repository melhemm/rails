document.addEventListener('turbolinks:load', () => {
  let confirmation_password_input = document.getElementById("user_password_confirmation");
  if (confirmation_password_input) {
    document.getElementById('new_user').addEventListener('input', checkpassword);
  }
})

const checkpassword = () => {
  const paswd = document.getElementById('user_password');
  const confirm_paswd = document.getElementById('user_password_confirmation');

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