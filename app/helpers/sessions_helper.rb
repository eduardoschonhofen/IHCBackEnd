module SessionsHelper
  # Logs in the given account.
  def log_in(account)
    session[:account_id] = account.id
  end

  # Returns the current logged-in account (if any).
  def current_account
    if session[:account_id]
      @current_account ||= Account.find_by(id: session[:account_id])
    end
  end

  # Returns the current user (if any).
  def current_user
    current_account.user
  end

  # Returns the current user type (if any).
  def current_usertype
    current_account.user_type
  end

  # Returns true if the account is logged in, false otherwise.
  def logged_in?
    !current_account.nil?
  end

  # Logs out the current account.
  def log_out
    session.delete(:account_id)
    @current_account = nil
  end

  ##### Before filters #####

  # Confirms a logged-in user.
  def redirect_non_logged
    unless logged_in?
      flash[:danger] = "Faça login para acessar essa página."
      redirect_to login_url
    end
  end

  def redirect_logged
    if logged_in?
      redirect_to app_path
    end
  end
end
