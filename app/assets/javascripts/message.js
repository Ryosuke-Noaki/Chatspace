$(function() {
  function buildHTML(message){
    var insertImage = '';
    if (message.image_url) {
      insertImage = `<img src="${message.image_url}">`;
    }
    var html = `<div class='chat-body' data-message-id="${message.id}">
                  <div class='chat-body--name'>
                    ${message.name}
                  </div>
                  <div class='chat-body--time'>
                    ${message.created_at}
                  </div>
                  <div class='chat-body--message'>
                    ${message.body}
                      </div>
                    ${insertImage}
                  </div>
                </div>`;
    return html;
  }

  $('#new_message').on('submit', function(e) {
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action')
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })

    .done(function(data) {
      var html = buildHTML(data);
      $('.main-content__chat-contents').append(html)
      $('#message_body').val('')
      // $('.chat-body').animate ({
      //   height: "500px"
      // });
    })
    .fail(function(){
      alert('メッセージの送信に失敗しました');
    })
  })
});

// setInterval(function() {
//   $.ajax({
//     url: location.href.json,
//   })

  // .done(function(json) {
  //   var insertHTML = '';
  //   json.messages.forEach(function(message) {
  //     insertHTML += buildHTML(message);
  //   });
  //   $('.chat-body').html(insertHTML);
  // })
  // .fail(function(data) {
  //   alert('自動更新に失敗しました');
  // },5000);
// });
