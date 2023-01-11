
document.addEventListener('turbolinks:load',  function() {
  let secondsRemaining = document.getElementById("timer_tag").dataset.timer;
  console.log(secondsRemaining);

    const interval = setInterval(() => {
      document.getElementById("timer").innerHTML = secondsRemaining;
      secondsRemaining--;

      if (secondsRemaining < 0) {
        clearInterval(interval);
      }
    }, 1000);

})

// 1. Определяем врменный интервал таймера - берем из БД
// 2. Запускаем таймер - каждую секунду вычитаем по секунде
// 3. Когда таймер = 0 делаем запрос к контроллеру чтобы убедиться что время действительно закончилось
// 4. Редиректим пользователя на страницу с результатом

