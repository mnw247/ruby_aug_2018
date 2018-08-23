class UsersController < ApplicationController
    skip_before_filter :require_login, :only => [:create, :new]
    before_action :current_user, only: [:edit, :show, :update, :delete]
    
    def index
    end
  
    def edit
    end
    
    def create
      if User.create(user_params).valid?
        session[:user_id] = User.last.id
        redirect_to "/events"
      else
        flash[:errors] = User.create(user_params).errors.full_messages
        redirect_to "/"
      end
    end
  
    def update
      user = User.find(params[:id])
      user.update(update_user_params)
      if user.valid?
        redirect_to "/events"
      else
        flash[:errors] = user.errors.full_messages
        redirect_to "/users/#{params[:id]}/edit"
      end
    end
  
    private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :city, :state, :password, :password_confirmation)
    end

    def update_user_params
      params.require(:user).permit(:first_name, :last_name, :email, :city, :state)
    end

  end