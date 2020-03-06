$("#comment_form").prepend("<%= j(render 'comment',{book_comment: @book_comment}) %>");
// $(function());
// $("#comment_body").val('');
// $("#comment_area").html("<%= escape_javascript(render('comment_area')) %>");