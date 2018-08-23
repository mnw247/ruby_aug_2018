class SessionsController < ApplicationController
  skip_before_action :require_login, except: [:destroy]

  def create
    @user = User.find_by_email(params[:email])
    if @user
      if @user.authenticate(params[:password])
        session[:user_id] = @user.id
        flash[:errors] = nil
        redirect_to "/songs"
      else
        flash[:errors] = ["Invalid Email/Password Combination"]
        redirect_to "/"
      end
    else
      flash[:errors] = ["There is no user by that email"]
      redirect_to "/"
    end
  end

  def destroy
    reset_session
    redirect_to '/'
  end
end
