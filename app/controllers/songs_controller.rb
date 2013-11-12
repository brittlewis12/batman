class SongsController < ApplicationController

  before_action :current_user
  before_action :set_song, except: [:new, :create]
  before_action :authenticated, :user_can_access_song

  def new
    @song = Song.new
    render :new
  end

  def create
    @song = Song.new(song_params)
    @song.creator_id = @current_user.id
    if @song.save
      redirect_to song_path(@song)
    else
      redirect_to #elsewhere #FIXME
    end
  end

  def show
    render :show
  end

  def edit
    render :edit
  end

  def update
    if @song.update(song_params)
      redirect_to song_path(@song)
    else
      render :edit
    end
  end

  def destroy
    @song.destroy
  end

private

  def song_params
    params.require(:song).permit(:name)
  end

  def set_song
    @song = Song.find(params[:id])
  end

  def user_can_access_song
    unless @song.users.include?(@current_user)
      redirect_to user_path(current_user)
    end    
  end
  
end
