class BookCommentsController < ApplicationController

	def create
		@book = Book.find(params[:book_id])
		@book_comment = current_user.book_comments.new(book_comment_params)
		@book_comment.user_id = current_user.id
		if @book_comment.save
      	flash[:success] = "Comment was successfully created."
      	redirect_to book_path(@book)
    	else
      	@book_comments = BookComment.where(book_id: @book.id)
      	render '/books/show'

# 		if comment.save
# 		respond_to do |format|
# 			format.html	{redirect_back(fallback_location: book)}
# 			format.json
# #			# format.js
		end
	end
#		redirect_back(fallback_location: book_path(book))

	end

	def destroy
	    @book_comment = BookComment.find(params[:book_id])
   		 if @book_comment.user != current_user
      		redirect_back(fallback_location: book)
    		end
    	@book_comment.destroy
    	redirect_to redirect_back(fallback_location: book)	end

	private

	def book_comment_params
		params.require(:book_comment).permit(:comment)
	end
end
