class TracksController < ApplicationController

before_action :set_track, except: [:create]

  def create
    @track = Track.new(track_params)
    @track.user_id = @current_user.id
    @track.save
  end

  def show
    render :show  
  end

  def update
  
  end

  def destroy
    @track.destroy
    redirect_to song_path(@track.song_id)
  end

 private

  def track_params
    params.require(:track).permit(:name, :desc, :url, :song_id)
  end

  def set_track
    @track = Track.find(params[:id])
  end

end