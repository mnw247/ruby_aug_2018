class UsersController < ApplicationController
  before_action :require_login, :only => [:show]
  
  def index
  end

  def create
    if User.create(user_params).valid?
      session[:user_id] = User.last.id
      redirect_to "/bright_ideas"
    else
      flash[:errors] = User.create(user_params).errors.full_messages
      redirect_to "/"
    end
  end

  def show
    @user = User.find(params[:id])
    @total = Like.where(user_id:params[:id]).count
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

  def check_user
    if current_user != User.find(params[:id])
      redirect_to "/users/#{session[:user_id]}"
    end
  end
end
