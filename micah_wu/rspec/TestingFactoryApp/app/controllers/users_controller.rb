class UsersController < ApplicationController
    def create
        @user = User.new(params.require(:user).permit(:first_name, :last_name, :email))
        if @user.save
            flash[:notice] = ['User successfully created']
            redirect_to new_user_path
        else
            #errors we need to code later
        end
    end
    
    def new 
    end
end
