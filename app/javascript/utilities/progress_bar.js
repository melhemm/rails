document.addEventListener('turbolinks:load', () => {
  const control = document.querySelector('.start-btn');
  if (control) { control.addEventListener('click', addProgress()) }
});

const addProgress = () => {
  const progress = document.getElementById('progress').dataset.progress;
  document.querySelector('.bar').style.width = progress + '%'
}
