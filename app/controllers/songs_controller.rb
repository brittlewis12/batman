class SongsController < ApplicationController
  before_action :current_user
  before_action :set_song, except: [:new, :create]
  before_action :authenticated!, except: :show

  def new
    @song = Song.new
    render :new
  end

  def create
    @song = Song.new(song_params)
    @song.creator_id = @current_user.id
    if @song.save
      @song.users << @current_user
      redirect_to song_path(@song)
    else
      render :new
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
    if @song.destroy
      redirect_to user_path(@current_user)
    else
      render :edit
    end
  end

private

  def song_params
    params.require(:song).permit(:name)
  end

  def set_song
    @song = Song.find(params[:id])
  end
end
