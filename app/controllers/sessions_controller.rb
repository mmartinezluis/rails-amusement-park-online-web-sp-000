class SessionsController < ApplicationController

  def new
  end

  def create
    
    @user = User.find_by(name: params[:user][:name])
    if @user
      #return head(:forbidden) unless @user.authenticate(params[:password])
      return redirect_to signin_path unless @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :'sessions/new'
    end
  end

  def destroy
    session.delete :user_id
    redirect_to '/'
  end

  private

  def require_login
    redirect_to '/' unless params[:user].include? :name
  end


end