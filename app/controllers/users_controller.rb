class UsersController < ApplicationController

  before_action :set_user, except: [:new, :create]
  before_action :authenticated!, :authorized!, except: [ :new, :create]

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id # FIXME make this more secure, force login at creation
      redirect_to user_path(@user)
    else
      redirect_to #adsfasfds # FIXME
    end
  end

  def edit
    render :edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def show
    render :show
  end

  def destroy 
    @user.destroy
  end

 private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def authorized!
    unless @user.id == session[:user_id]
      redirect_to user_path(session[:user_id])
    end
  end

end
