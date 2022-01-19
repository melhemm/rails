document.addEventListener('turbolinks:load', function() {
  const testTimer = document.querySelector(".test-timer");
  if (testTimer) { countDown(testTimer) }
})

const countDown = (timer) => {
  let limitInSeconds = timer.dataset.timeLimit
  showRemainigTime(limitInSeconds, timer)

  const timerId = setInterval(() => {
    limitInSeconds--
    showRemainigTime(limitInSeconds, timer)

    if (limitInSeconds == 0) {
      clearInterval(timerId)
      timer.textContent = "Time is over"
      window.location.replace(window.location + '/result')
    }
  }, 1000)
}

const showRemainigTime = (seconds, timer) => {
  timer.textContent =  "Time remaining: " + parseInt(seconds / 60) + ":" + (seconds % 60)
}
