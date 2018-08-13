class CommentsController < ApplicationController

def index
  	@comments = Comment.all
  	@user = User.find(params[:user_id])
  	@message = Message.find(params[:message_id])
  end
def create
  @users = User.find(params[:user_id])
  @messages = Message.find(params[:message_id])
  @comments = Comment.new(params.require(:comment).permit(:comment, :user_id, :message_id))
  if @comments.save
    redirect_to "/users/"+ @users.id.to_s + "/messages"
  else
  	flash[:notice]= @messages.errors.full_messages
	redirect_to "/users/"+ @users.id.to_s + "/messages"
  end
end
end

