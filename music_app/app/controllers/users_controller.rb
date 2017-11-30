class UsersController < ApplicationController
  def new
  end

  def create
    user = User.new(user_params)

    if user.save
      log_in_user!(user)
      redirect_to user_url(user.id)
    else
      render :new
    end

  end

  def show
    @user = current_user
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
