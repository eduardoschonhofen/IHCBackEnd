class SessionsController < ApplicationController
  layout "app"

  # skip_before_action :redirect_non_logged, only: [:new, :create]
  # before_action :redirect_logged, except: [:destroy]

  def new
  end

  def create
    account = Account.find_by(card_number: params[:session][:card_number])
    if account && account.authenticate(params[:session][:password])
      log_in account
      redirect_to app_path
    else
      flash.now[:danger] = "Combinação de usuário e senha inválida. Tente novamente."
      render 'new'
    end
  end

  def destroy
    log_out
    flash[:success] = 'Logout realizado com sucesso.'
    redirect_to login_path
  end
end
