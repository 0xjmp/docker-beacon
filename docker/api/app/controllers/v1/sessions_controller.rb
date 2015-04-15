class V1::SessionsController < V1::BaseController
  skip_before_filter :authenticate_user!, only: [:create]

  def create
    @user = User.find_or_create_from_omniauth(omniauth_hash)
    sign_in @user
    render status: :ok, nothing: true
  end

  def destroy
    sign_out current_user
    render status: :no_content, nothing: true
  end

end