class UserRoomChannel < ApplicationCable::Channel
  def subscribed
     stream_from "some_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
  	ActionCable.server.broadcast 'user_room_channnel',chat: data['chat']
end
