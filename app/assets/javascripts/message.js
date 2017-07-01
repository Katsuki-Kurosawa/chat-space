$(function(){

 function buildHTML(message){
      if (message.image.image.url == null){
        html = (`<p class="chat-content__users">${message.user_name}
               <span class="chat-content__time"> ${message.created_at}</span></p><p class="chat-content__message"> ${message.body}</p>`)
      } else {
        html = ( `<p class="chat-content__users">${message.user_name}
               <span class="chat-content__time"> ${message.created_at}</span></p> <img src= ${message.image.image.url} class="chat-content__message" width="300" height="200"> `)}
    return html;
  }


  function flash() {
    var html =
      `<p class="alert-notice">メッセージを送信しました</p>`
    $('.notice').append(html);
    $('.alert-notice').fadeIn(500).fadeOut(2000);
    setTimeout(function(){
     $('.alert-notice').remove();
    },2500);
  }

  $('#new_message').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var href = window.location.href
    $.ajax({
      url: href,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })

    .done(function(data){
      var html = buildHTML(data);
      $('.chat-content').append(html)
      $('.texts').val('');
      flash();
      $('.sent').prop('disabled', false)
      $('.chat-content').animate({scrollTop: $('.chat-content')[0].scrollHeight}, 'slow');
    })
     .fail(function(){
      alert('メッセージを入力してください');
    })
  })
});
