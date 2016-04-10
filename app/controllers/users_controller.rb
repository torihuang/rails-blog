class UsersController < ApplicationController

  def show
    @user = User.find_by(id: params[:id])
  end

  def new
    @user = User.new(password: '')
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      render action: "new"
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :birthday, :password)
  end

  # def password_param
  #   params.require(:user).permit(:password)
  # end
end
