class LikesController < ApplicationController
  def create
    @user = current_user
    @secret = Secret.find(params[:id])
    @like = Like.new(user: @user, secret:@secret)
    if @like.valid?
      @like.save
      redirect_to :back
    else
      flash[:errors] =['Something went wrong']
      redirect_to :back
    end
  end

  def delete
    @user = current_user
    @secret = Secret.find(params[:id])
    @like = Like.find_by(user: @user, secret: @secret)
    if @like.valid?
      @like.destroy
      redirect_to :back
    else
      flash[:errors] =['Something went wrong']
      redirect_to :back
    end
  end

  private
  def check_user
    @like = Like.find_by(params[:id])
    if current_user != @like.user
      redirect_to "/users/#{session[:user_id]}"
    end
  end
end
