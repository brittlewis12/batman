class UsersController < ApplicationController

  before_action :set_user, except: [:new, :create]

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user)
    else
      redirect_to gjhkl
    end
  end

  def edit
    render :edit
  end

  def update
  
  end


  def destroy

  end

  def show
    render :show
  end




 private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

  def set_user
    @user = User.find(params[:id])
  end

end