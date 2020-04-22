document.addEventListener('turbolinks:load', function(){
  var pass = document.getElementById('user_password')
  var passConf = document.getElementById('user_password_confirmation')

  // check if the elements exist on page, to add EventListener only on /sign_up
  if(pass && passConf){
    passConf.addEventListener('input', checkPasswordMatch)
  }
})


function checkPasswordMatch(){
  var pass = document.getElementById('user_password')
  var passConf = document.getElementById('user_password_confirmation')
  var octIconX = document.querySelector('.octicon-x')
  var octIconCheck = document.querySelector('.octicon-check')

  if (passConf.value.length == 0){
    octIconX.classList.add('hide')
    octIconCheck.classList.add('hide')
    return
  }

  if (pass.value === passConf.value){
    octIconX.classList.add('hide')
    octIconCheck.classList.remove('hide')
    return
  }

  octIconCheck.classList.add('hide')
  octIconX.classList.remove('hide')
}
