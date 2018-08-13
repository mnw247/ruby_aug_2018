class UsersController < ApplicationController
  def new
  	@users = User.all
  end

def create
  @user = User.new(params.require(:user).permit(:username))
  if @user.save
    flash[:notice] = ["Welcome #{@user.username}"]
    puts 'flash'
    # redirect_to new_user_path @user
    redirect_to "/users/"+ @user.id.to_s + "/messages"
  else
  	flash[:notice]= @user.errors.full_messages
	redirect_to new_user_path
    puts 'else'
  end
  puts 'end'
end  

  def show
  end
end
