class WelcomeController < ApplicationController

  def index
    redirect_to new_user_path
  end

end
