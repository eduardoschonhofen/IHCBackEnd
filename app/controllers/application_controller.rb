require "application_responder"

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :json

  include SessionsHelper
  protect_from_forgery with: :null_session

  # before_action :redirect_non_logged
end
