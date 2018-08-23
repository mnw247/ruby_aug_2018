class UsersController < ApplicationController
  skip_before_filter :require_login, :only => [:create, :new]
  before_action :check_user, only: [:edit, :show, :update, :delete]
  
  def new
  end

  def create
    @user = User.create(user_params)
    unless @user.valid?
      flash[:notice] = @user.errors.full_messages
      redirect_to "/users/new"
    else
      redirect_to "/users/#{@user.id}"
    end
  end

  def show
    @user = User.find(params[:id])
    @secrets = Secret.all
    render layout: "two_column"
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.email = params['Email']
    @user.name = params['Name']
    if @user.valid?
      @user.save
      redirect_to "/users/#{@user.id}"
    else
      flash[:errors] = ['Email is invalid']
      redirect_to :back
    end
  end

  def delete
    @user = User.find(params[:id])
    @user.destroy
    reset_session
    redirect_to '/users/new'
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

  def check_user
    if current_user != User.find(params[:id])
      redirect_to "/users/#{session[:user_id]}"
    end
  end

end
