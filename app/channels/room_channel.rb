class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_1"
  end
end
