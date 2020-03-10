class UserRoomController < ApplicationController
	def show
		@chat = Chat.all
	end
end
