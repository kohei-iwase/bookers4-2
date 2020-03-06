$("#js_comment").prepend("<%= j(render 'comment',{book_comment: @book_comment}) %>");
$("#tcomment_body").val('');
// $("#comment_area").html("<%= escape_javascript(render('comment_area')) %>");