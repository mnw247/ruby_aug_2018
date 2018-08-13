class UsersController < ApplicationController
  layout "two_column"
  def index
    @users = User.all
  end

  def create
    user = User.create(user_params)
    unless user.valid?
      flash[:notice] = user.errors.full_messages
      redirect_to "/user"
    else
      redirect_to "/user"
    end
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :favorite_language)
    end
end
