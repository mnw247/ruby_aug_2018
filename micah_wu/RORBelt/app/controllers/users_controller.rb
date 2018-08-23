class UsersController < ApplicationController

  def index
  end

  def new
  end

  def create
    new_user = User.create(user_params)
    if new_user.valid?
      session[:user_id] = User.last.id
      redirect_to "/songs"
    else
      flash[:errors] = new_user.errors.full_messages
      redirect_to "/main"
    end
  end

  def show
    @user = User.find(params[:id])
    @playlist = Playlist.where(user_id: params[:id])
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end

end
