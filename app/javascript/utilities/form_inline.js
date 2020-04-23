document.addEventListener('turbolinks:load', function() {
  $('.js-form-inline-link').on('click', formInlineLinkHandler)

  var errors = document.querySelector('.js-resource-errors')

  if (errors) {
    var resourceId = errors.dataset.resourceId
    formInlineHandler(resourceId)
  }
})

function formInlineLinkHandler(event) {
  event.preventDefault()

  var testId = this.dataset.testId
  formInlineHandler(testId)
}

function formInlineHandler(testId){
  var link = document.querySelector('.js-form-inline-link[data-test-id="' + testId + '"]')
  var $testTitle = $('.js-test-title[data-test-id="' + testId + '"]')
  var $formInline = $('.js-form-inline[data-test-id="' + testId + '"]')

  if (link == null){ return }

  $formInline.toggle()
  $testTitle.toggle()

  if ($formInline.is(':visible')) {
    link.textContent = 'Cancel'
  } else {
    link.textContent = 'Edit'
  }
}
