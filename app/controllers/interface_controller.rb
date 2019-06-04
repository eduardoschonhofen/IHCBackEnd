class InterfaceController < ApplicationController
  def data
    render json: {texto: "FUNCIONOU!!!"}
  end

  def send_data
    puts params
  end

  def scan
    ActionCable.server.broadcast("room_1", code: Digest::SHA1.hexdigest(DateTime.now.strftime("%Q")), message: params[:code])
    respond_with(msg: "SERVER GET RESPONSE")
  end
end
