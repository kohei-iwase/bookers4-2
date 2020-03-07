$(document).on('turbolinks:load', function(){
  function buildHTML(comment){
    var html = `
                <div class ="username">
                <a href=/users/${book_comment.user_id}>${book_comment.user_name}</a>
                <div class="comment-style">
                  ${book_comment.text}`
    return html;
  }
  $('#new_comment').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var href = window.location.href + '/comments'
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
      $('.comments').prepend(html);
      $('.comment__body').val('')
    })
//↓エラー時の処理
    .fail(function(){
      alert("error");
    })
  })
})

// $("#comment_form").prepend("<%= j(render 'comment',{book_comment: @book_comment}) %>");
// $(function());
// $("#comment_body").val('');
// $("#comment_area").html("<%= escape_javascript(render('comment_area')) %>");