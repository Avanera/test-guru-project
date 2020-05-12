document.addEventListener('turbolinks:load', function() {
  var timer = document.querySelector('.timer');
  if (timer) {
    // count-up timer
    var localNow = new Date();
    // format: Mon May 11 2020 21:12:48 GMT+0700 (Krasnoyarsk Standard Time) {}
    var utcNow = new Date(localNow.getTime() + localNow.getTimezoneOffset() * 60000);
    // format: Mon May 11 2020 14:12:48
    var now = utcNow.getTime(); // get milliseconds

    var localStartTime = new Date(parseInt(timer.dataset.startTime));
    var utcStartTime = new Date(localStartTime.getTime() + localStartTime.getTimezoneOffset() * 60000);
    var startTime = utcStartTime.getTime();

    var timerVar = setInterval(countTimer, 1000);
    var totalSeconds = parseInt((now - startTime)/1000); // get difference in seconds
    function countTimer() {
       ++totalSeconds;
       // redirect when timer is out
      if (totalSeconds > timer.dataset.timer){
        redirectToResultPage();
        function redirectToResultPage() {
          // create a url with totalSeconds parameter
          window.location.href = timer.dataset.resultUrl;
        }
      }
       var hour = Math.floor(totalSeconds /3600);
       var minute = Math.floor((totalSeconds - hour*3600)/60);
       var seconds = totalSeconds - (hour*3600 + minute*60);
       if(hour < 10)
         hour = "0"+hour;
       if(minute < 10)
         minute = "0"+minute;
       if(seconds < 10)
         seconds = "0"+seconds;
       timer.innerHTML = hour + ":" + minute + ":" + seconds;
    }
  }
})
