document.addEventListener('turbolinks:load', function(){
  var control = document.getElementById('user_password_confirmation')

  control.addEventListener('input', checkPasswordMatch)
})


function checkPasswordMatch(){
  var pass = document.getElementById('user_password').value
  var passConf = document.getElementById('user_password_confirmation').value

  if (passConf.length == 0){
    document.querySelector('.octicon-x').classList.add('hide')
    document.querySelector('.octicon-check').classList.add('hide')
  } else if (pass === passConf){
    document.querySelector('.octicon-x').classList.add('hide')
    document.querySelector('.octicon-check').classList.remove('hide')
  } else {
    document.querySelector('.octicon-check').classList.add('hide')
    document.querySelector('.octicon-x').classList.remove('hide')
  }
}
