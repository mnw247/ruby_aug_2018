class SecretsController < ApplicationController
  def index
    @secrets = Secret.all
  end

  def create
    @secret = Secret.create(secret_params)
    unless @secret.valid?
      redirect_to "/users/#{@secret.user_id}"
    else
      flash[:errors] = ['Please enter a valid secret']
      redirect_to "/users/#{@secret.user_id}"
    end
  end
  
  def delete
    @user = current_user
    secret = Secret.find(params[:id])
    if secret.user == @user
      secret.destroy
    end
    redirect_to  "/users/#{@user.id}"
  end

  private
  def secret_params
    params.require(:secret).permit(:content, :user_id)
  end
end