class SongsController < ApplicationController

  def index
  end

  def new
  end

  def show
    @songs = Song.all
  end

  def show_song
    @song = Song.find(params[:id])
    @users = Playlist.joins(:song).where(song_id: params[:id]).where.not(user_id: current_user.id)
  end

  def create
    song = Song.where("title = ? AND artist = ?", params[:song][:title], params[:song][:artist])
    # puts song.count
    # puts song.first.title
    if song.count > 0 && Playlist.where(user_id: current_user.id, song_id: song.first.id).count > 0
      new_total = song.first.total + 1
      song.first.update(total: new_total)
      playlist = Playlist.where(user_id: current_user.id, song_id: song.first.id)
      new_playlist_total = playlist.first.total + 1
      playlist.first.update(total: new_playlist_total)
      redirect_to "/songs"
    elsif song.count > 0 && Playlist.where(user_id: current_user.id, song_id: song.first.id).count < 1
      new_total = song.first.total + 1
      song.first.update(total: new_total)
      Playlist.create(user_id: current_user.id, song_id: song.first.id, total: 1)
      redirect_to "/songs"
    else
      new_song = Song.create(song_params.merge(total: 1))
      if new_song.valid?
        Playlist.create(user_id: current_user.id, song_id: song.first.id, total: 1)
        redirect_to "/songs"
      else
        flash[:errors] = new_song.errors.full_messages
        redirect_to "/songs"
      end
    end
  end

  private
  def song_params
    params.require(:song).permit(:title, :artist)
  end


end
