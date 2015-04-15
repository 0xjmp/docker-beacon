module ApplicationHelper

  protected

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def signed_in?
    !!current_user
  end

  def sign_in(user)
    self.current_user = user
  end

  def sign_out(user)
    self.current_user = nil
  end

  def current_user=(user)
    @current_user = user
    session[:user_id] = user.nil? ? nil : user.id
  end

  def authenticate_user!
    unless signed_in?
      render status: :unauthorized, json: {
        error: I18n.t(:unauthorized)
      } and return false
    end
    true
  end

end
