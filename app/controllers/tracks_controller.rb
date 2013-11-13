class TracksController < ApplicationController

before_action :current_user
# before_action :set_track, except: [:new, :create]

  def new
    @song = Song.find(params[:song_id])
    @track = Track.new
  end

  def create
    require 'json'
    @track = Track.new(track_params)
    @track.user_id = @current_user.id
    @track.song_id = params[:song_id]
    @track.save

    response = {great_success: "IT WORKED"}.to_json

    render json: response
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
    params.require(:track).permit(:name, :desc, :url)
  end

  def set_track
    @track = Track.find(params[:id])
  end

end

