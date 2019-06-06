class SessionsController < ApplicationController
  layout "app"

  # skip_before_action :redirect_non_logged, only: [:new, :create]
  # before_action :redirect_logged, except: [:destroy]

  def new
  end

  def create
    account = Account.find_by(card_number: params[:card_number])
    if account && account.authenticate(params[:password])
      render json: {status: true, user_type: account.user_type}
    else
      render json: {status: false, user_type: nil}
    end
  end

  def destroy
    log_out
    flash[:success] = 'Logout realizado com sucesso.'
    redirect_to login_path
  end
end
