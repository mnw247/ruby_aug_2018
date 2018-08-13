class MessagesController < ApplicationController
def index
  	@messages = Message.all
  	@user = User.find(params[:user_id])
    @comments = Comment.all
  end

def create
  @users = User.find(params[:user_id])
  @messages = Message.new(params.require(:message).permit(:content, :user_id))
  if @messages.save
    flash[:notice] = ["Post Successful #{@messages.content}"]
    redirect_to "/users/"+ @users.id.to_s + "/messages"
  else
  	flash[:notice]= @messages.errors.full_messages
	redirect_to "/users/"+ @users.id.to_s + "/messages"
  end
end

end
