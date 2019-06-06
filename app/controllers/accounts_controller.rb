class AccountsController < ApplicationController
  def create
    @user = eval "#{params[:user_type]}.create"
    @account = @user.build_account(account_params)
    @account.password_confirmation = @account.password

    if @account.save
      render json: {saved: true, error: nil}
    else
      render json: {saved: false, error: @account.errors.full_messages}
    end
  end
end

private

  def account_params
    params.permit(:card_number, :password, :password_confirmation, :name, :email)
  end
