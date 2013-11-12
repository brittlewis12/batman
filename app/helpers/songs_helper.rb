module SongsHelper

  def user_can_access_song
    unless @song.users.include?(@current_user)
      redirect_to user_path(current_user)
    end    
  end

end

##user must be logged in, and belong to the song. ##