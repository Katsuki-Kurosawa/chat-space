$(function(){

  function buildHTML(message){
   if(message.image){
     var image = `<p><img src= ${message.image} class="chat-content__message" width="300" height="200"></p>`
   } else { var image = '';
   }
   var content = `
   <p class="messages" data-id='${message.id}'></p>
   <p class="chat-content__users">${message.user_name}
   <span class="chat-content__time"> ${message.created_at}</span></p>
   <p class="chat-content__message"> ${message.body} ${image}</p>`
   return content;
  }

  function flash() {
    var html =
    `<p class="alert-notice">メッセージを送信しました</p>`
    $('.notice').append(html);
    $('.alert-notice').fadeIn(500).fadeOut(2000);
    setTimeout(function(){
     $('.alert-notice').remove();
   }, 2500);
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
      $('ul.chat-messages').append(html)
      $('.texts').val('');
      $('.chat-footer__files').val('');
      flash();
      $('.sent').prop('disabled', false)
      $('.chat-content').animate({scrollTop: $('.chat-content')[0].scrollHeight}, 'slow');
    });
  });

  var interval = setInterval(function() {
    if (window.location.href.match(/\/groups\/\d+\/messages/))
    {
      if($('.messages')[0]){
        var message_id = $('.messages:last').data('id');
       }else {
       var message_id = 0
       }
      $.ajax({
        url: location.href,
        type: 'GET',
        data: {
          message: { id: message_id }
        },
        dataType: 'json'
      })
    .done(function(data){
      if(data.forEach) {
        data.forEach(function(message){
          var message_id = $('.messages:last').data('id');
            if (message.id > message_id) {
              var html = buildHTML(message);
              $('ul.chat-messages').append(html);
              $('.chat-content').animate({scrollTop: $('.chat-content')[0].scrollHeight}, 'slow');
            }
          });
        };
      });
    }else{
      clearInterval(interval);
    }}, 5 * 1000)
});
