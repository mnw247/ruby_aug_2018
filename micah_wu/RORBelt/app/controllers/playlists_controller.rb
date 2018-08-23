class PlaylistsController < ApplicationController
  def new
  end

  def create
  end


  # def update
  #   playlist = Playlist.where(user_id: current_user.id, song_id: params[:song_id])
  #   new_playlist_total = playlist.first.total + 1
  #   playlist.first.update(total: new_playlist_total)
  #   song = Song.find(params[:song_id])
  #   new_total = song.total + 1
  #   song.update(total: new_total)
  #   redirect_to "/songs"
  # end

  def update
  song = Song.find(params[:song_id])
  @playlist = Playlist.find_by(user_id: current_user.id, song_id: params[:song_id])
    if @playlist
      new_playlist_total = @playlist.total + 1
      @playlist.update(total: new_playlist_total)
      new_total = song.total + 1
      song.update(total: new_total)
      redirect_to "/songs"
    else
      Playlist.create(user_id: current_user.id, song_id: params[:song_id], total: 1)
      redirect_to "/songs"
    end
  end


end
  