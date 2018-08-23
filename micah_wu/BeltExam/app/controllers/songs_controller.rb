class SongsController < ApplicationController
  before_action :require_login

  def index
    @songs = Song.all

  end

  def show
    @song = Song.find(params[:id])
    @users = Song.find(params[:id]).subscribed_users.group(:id)
  end

  def add
    Playlist.create(user_id: session[:user_id], song_id: params[:id])
    redirect_to "/songs"
  end

  def create
    if Song.create(song_params).valid?
      redirect_to "/songs"
    else
      flash[:errors] = Song.create(song_params).errors.full_messages
      redirect_to "/songs"
    end
  end

  private
  def song_params
    params.require(:song).permit(:artist, :title)
  end
end
