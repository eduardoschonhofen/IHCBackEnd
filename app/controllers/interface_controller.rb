class InterfaceController < ApplicationController
  def data
    render json: {texto: "FUNCIONOU!!!"}
  end

  def send_data
    puts params
  end

  def scan
    @account = Account.find_by_card_number params[:card_number]
    @discipline = Discipline.find_by_id params[:discipline]
    @timestamp = params[:timestamp]

    ActionCable.server.broadcast("room_1", discipline: @discipline.id, timestamp: DateTime.now.strftime("%Q"))

    if @account && @discipline && @timestamp && @account.user_type == "Student"
      Attendance.create(code: params[:timestamp], discipline: @discipline, student: @account.user)
      render json: {status: true}
    else
      render json: {status: false}
    end
  end
end
