class Crew::UsersController < CrewController
  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update_attributes user_params
      redirect_to [:edit, :crew, :user], notice: 'Updated'
    else
      render :edit
    end
  end

private
  def user_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
