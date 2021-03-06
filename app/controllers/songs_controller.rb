class SongsController < ApplicationController

  def index
    @songs = Song.all
  end

  def show
    @song = find_user_by_id
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.create(params.require(:song).permit(:name, :artist_id, :genre_id))

    redirect_to song_path(@song)
  end

  def edit
    @song = find_user_by_id
  end

  def update
    @song = find_user_by_id
    @song.update(params.require(:song).permit(:name, :artist_id, :genre_id))

    redirect_to song_path(@song)
  end


  private

  def find_user_by_id
    Song.find(params[:id])
  end
end
