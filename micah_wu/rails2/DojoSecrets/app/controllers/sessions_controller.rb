class SessionsController < ApplicationController
skip_before_action :require_login

  def new
  end
  
  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password_confirmation])
      session[:user_id] = @user.id
      redirect_to "/users/#{@user.id}"
    else
      flash[:errors] = ['Email and Password are Incorrect']
      redirect_to :back
    end
  end

  def destroy
    reset_session
    redirect_to '/sessions/new'
  end

end
