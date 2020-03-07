class FavoritesController < ApplicationController
	def create
        @book = Book.find(params[:book_id])
        favorite = current_user.favorites.new(book_id: book.id)
        # if favorite.save
        favorite.save
#        respond_to :js
		redirect_back(fallback_location: book_path(book))
    end

    def destroy
        book = Book.find(params[:book_id])
        favorite = current_user.favorites.find_by(book: book.id)
        favorite.destroy
		redirect_back(fallback_location: book_path(book))
    end

    private
  def redirect
    case params[:redirect_id].to_i
    when 0
      redirect_to books_path
    when 1
      redirect_to book_path(@book)
    end
  end
end
