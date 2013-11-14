class CollaboratorsController < ApplicationController
  def new
    @song = Song.find(params[:song_id])
  end

  def create
    @song = Song.find(params[:song_id])
    @user = User.find_by(username: params[:username])

    if !@song.users.include?(@user) && @song.users << @user
      redirect_to song_path(@song)
    else
      render :new
    end
  end
end
