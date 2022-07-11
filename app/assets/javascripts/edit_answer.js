$(function() {

  $(document).on("click", '.js-edit-answer-button', function(e) {
      e.preventDefault();
      const answerId = $(this).data("answer-id")
      switchToEdit(answerId)
  })

  $(document).on("click", '.js-button-edit-answer-cancel', function() {
      clearErrorMessages()
      const answerId = $(this).data("answer-id")
      switchToLabel(answerId)
  })

  $(document).on("click", '.js-button-answer-update', function() {
      clearErrorMessages()
      const answerId = $(this).data("answer-id")
      submitAnswer($("#js-textarea-answer-" + answerId).val(), answerId)
          .then(result => {
              $("#js-answer-" + result.answer.id).html(result.answer.body.replace(/\r?\n/g, '<br>'))
              switchToLabel(result.answer.id)
          })
          .catch(result => {
              const answerId = result.responseJSON.answer.id
              const messages = result.responseJSON.errors.messages
              showErrorMessages(answerId, messages)
          })
  })

  function switchToLabel(answerId) {
      $("#js-textarea-answer-box-" + answerId).hide()
      $("#js-answer-" + answerId).show()
  }

  function switchToEdit(answerId) {
      $("#js-answer-" + answerId).hide()
      $("#js-textarea-answer-box-" + answerId).show()
  }

  function showErrorMessages(answerId, messages) {
      $('<p class="error_messages text-danger">' + messages.join('<br>') + '</p>').insertBefore($("#js-textarea-answer-" + answerId))
  }

  function submitAnswer(body, answerId) {
      return new Promise(function(resolve, reject) {
          $.ajax({
              type: 'PATCH',
              url: '/answers/' + answerId,
              data: {
                  answer: {
                      body: body
                  }
              }
          }).done(function (result) {
              resolve(result)
          }).fail(function (result) {
              reject(result)
          });
      })
  }

  function clearErrorMessages() {
      $("p.error_messages").remove()
  }
});