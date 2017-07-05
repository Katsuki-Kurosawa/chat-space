$(function() {

  function  appendUser(user) {
    var html =`
  <div class="chat-group-users clearfix">
  <p class="chat-group-user__name">${user.name}</p>
  <a class="user-search-add chat-group-user__btn chat-group-user__btn--add" data-user-id=${user.id} data-user-name=${user.name}>追加</a></div>`
    $("#user-search-result").append(html);
  }

  function buildUser(id, name) {
    var html =`
    <div class="chat-group-user clearfix" id="chat-group-user-${id}">
    <input type="hidden" name="group[user_ids][]" value="${id}">
    <p class="chat-group-user__name">${name}</p>
    <a class="user-search-remove chat-group-user__btn chat-group-user__btn--remove" data-user-id="${id}">削除</a></div>`
   $('#chat-group-users').append(html);
   $('.chat-group-users').remove();
   $this.parent('.chat-group-user').remove();
  }

  $("#user-search-field").on('keyup', function() {
    var input = $("#user-search-field").val();
    var href = window.location.href
    $.ajax('/users.json',{
      type: 'GET',
      url: href,
      data: { name: input },
      dataType: 'json'
  })

  .done(function(users) {
    $(".chat-group-users").remove();
    if (users.length !== 0) {
      users.forEach(function(user){
        appendUser(user);
      });
    }
    else {
      appendNoUser("一致するユーザーがいません");
    }
  });

  $('#user-search-result').on('click', '.user-search-add', function(){
    var $this = $(this);
    var id = $this.data('userId');
    var name = $this.data('userName');
    buildUser(id, name);
    });
  });

  $('#chat-group-users').on('click', '.user-search-remove', function(){
    var $this = $(this);
    var id = $this.data('userId');
    $('#chat-group-user-' + id).remove();
  })
});