class SessionsController < ApplicationController
  
  def new
    render :new
  end

  def create
    user = User.find_by(username: params[:username])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user_path(user)  
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to(new_session_path)
  end

end