class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      login @user

      redirect_to question_path(1)
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:email)
  end
end
