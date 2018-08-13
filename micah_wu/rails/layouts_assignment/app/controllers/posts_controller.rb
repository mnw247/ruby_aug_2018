class PostsController < ApplicationController
  layout "three_column"
  def index
    @posts = Post.all
    @users = User.all
  end
  
  def create
    post = Post.create(post_params)
    unless post.valid?
      flash[:notice] = post.errors.full_messages
      redirect_to "/post"
    else
      redirect_to "/post"
    end
  end

  private
    def post_params
      params.require(:post).permit(:title, :content, :user_id)
    end
end
