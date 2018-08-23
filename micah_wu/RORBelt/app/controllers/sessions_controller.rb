class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user
      if user.authenticate(params[:password])
        session[:user_id] = user.id
        flash[:errors] = nil
        redirect_to "/songs"
      else
        flash[:errors] = ["Invalid Email/Password Combination"]
        redirect_to "/main"
      end
    else
      flash[:errors] = ["There is no user by that email"]
      redirect_to "/main"
    end
  end

  def destroy
    reset_session
    redirect_to "/main"
  end

end
