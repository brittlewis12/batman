class TracksController < ApplicationController
  before_action :current_user

  def new
    @song = Song.find(params[:song_id])
    @track = Track.new
  end

  def create
    @track = Track.new(track_params)
    @track.user_id = @current_user.id
    @track.song_id = params[:song_id]
    @track.save # FIXME active_record validations for url uniqueness fails.
    response = {great_success: "IT WORKED"}.to_json
    render json: response
  end

  def destroy
    @track = Track.find(params[:id])
    @track.removed = true
    if @track.save
      redirect_to song_path(@track.song_id)
    else
      render 'songs/show'
    end
  end

 private

  def track_params
    params.require(:track).permit(:name, :desc, :url)
  end
end
