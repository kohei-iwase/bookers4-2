class SearchController < ApplicationController
	
	def search
	    @q = User.ransack(params[:q])
    	@users = @q.result(distinct: true)
    	# @b = Book.ransack(params[:b])
    	# @books = @b.result(distinct: true)
	end

	def searched
		@result = @q.result(distinct: true)#ここで検索
	end
end
