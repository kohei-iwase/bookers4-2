class BookCommentsController < ApplicationController

	def create
	    @book = Book.find(params[:book_id])
	    @book_comment = @book.book_comments.new(book_comment_params)
	    @book_comment.user_id = current_user.id
	    if @book_comment.save
	      flash[:success] = "Comment was successfully created."
	    else
	      @book_comments = BookComment.where(id: @book)
	    end
	end
	
	def destroy
	    @book_comment = BookComment.find(params[:book_id])
	    @book = @book_comment.book
    	@book_comment.destroy
   # 	redirect_to redirect_back(fallback_location: book)
    end

	private

	def book_comment_params
		params.require(:book_comment).permit(:comment,:user_id)
	end
end
