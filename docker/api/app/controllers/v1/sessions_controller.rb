class V1::SessionsController < V1::BaseController
  skip_before_filter :authenticate_user!, only: [:new, :create]

  def create
    unless signed_in?
      @user = User.find_or_create_from_omniauth(omniauth_hash)
    else
      current_user.find_or_create_identity(omniauth_hash)
    end
    sign_in @user unless signed_in?
    render status: :ok, nothing: true
  end

  def destroy
    sign_out current_user
    render status: :no_content, nothing: true
  end

end