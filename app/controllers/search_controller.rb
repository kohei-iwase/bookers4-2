class SearchController < ApplicationController
	def index
		@s = User.ransack(params[:q])
		@users =  @q.result
	end
end
