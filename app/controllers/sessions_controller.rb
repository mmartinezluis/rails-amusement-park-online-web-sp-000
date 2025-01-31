class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:error] = "Incorrect username and/or password"
      redirect_to signin_path
    end
  end

  def destroy
    session.delete :user_id
    redirect_to '/'
  end
end