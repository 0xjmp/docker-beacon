class ApplicationController < ActionController::Base
  include ApplicationHelper
  helper_method :current_user, :signed_in?, :sign_in, :sign_out, :authenticate_user!

  before_filter :authenticate_user!

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  respond_to :json

  def omniauth_hash
    request.env['omniauth.auth']
  end
end
