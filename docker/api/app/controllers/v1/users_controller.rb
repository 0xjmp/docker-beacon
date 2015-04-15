class V1::UsersController < V1::BaseController
  skip_before_filter :authenticate_user!, only: [:show]

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = current_user
    @user.update_attributes!(user_params)
    render :show
  end

  protected

  def user_params
    params.require(:user).permit(:visible)
  end

end