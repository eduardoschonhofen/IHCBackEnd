class InterfaceController < ApplicationController
  def data
    render json: {texto: "FUNCIONOU!!!"}
  end
  
  def send_data
    puts params
  end
end
