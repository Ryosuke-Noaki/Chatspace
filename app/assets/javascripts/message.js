$(function() {
  function buildHTML(message){
    var html = `<div class = 'chat-body'>
                  <div class = 'chat-body--name' >
                    <%= message.user_name %>
                  </div>
                  <div class = 'chat-body--time' >
                    <%= message.created_at %>
                  </div>
                  <div class = 'chat-body--message' >
                    <%= if message.body.present? %>
                      <div class = 'chat-body--message__content' >
                        <%= message.body %>
                      </div>
                    <%= image_tag message.image_url %>
                    <% end %>
                  </div>
                </div>`
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
      $('.chat-body').animate ({
        hight: "500px";
      });
    })
    .fail(function(){
      alert('error');
    })
  })
});
