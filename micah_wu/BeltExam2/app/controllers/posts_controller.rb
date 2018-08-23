class PostsController < ApplicationController
  before_action :require_login
  def index
    @posts = Post.includes(:user)
    @current_user = current_user
  end

  def show
    @post = Post.find(params[:id])
    @user = @post.users_that_liked.distinct
  end

  def create
    if Post.create(post_params).valid?
      redirect_to "/bright_ideas"
    else
      flash[:errors] = Post.create(post_params).errors.full_messages
      redirect_to "/bright_ideas"
    end
  end

  def destroy
    post = Post.find(params[:id])
    # post.delete_all
    # post.delete
    Post.destroy(post)
    redirect_to "/bright_ideas"
  end

  private
  def post_params
    params.require(:post).permit(:content, :user_id)
  end
end
