class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash.now.alert = 'Login failed'
      render :new
    end
  end

  def delete
    session[:user_id] = nil
    flash[:message] = "Successful logout. See you next time!"
    redirect_to root_path
  end
end