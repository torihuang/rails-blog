class SessionController < ApplicationController

  def new
    @user = User.new(password: '')
  end

  def create
    @user = User.authenticate(session_params)
    if @user
      session[:user_id] = @user.id
      redirect_to @user
    else
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to "/"
  end

  private

  def session_params
    params.require(:session).permit(:username, :password)
  end
end
