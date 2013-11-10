class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :require_login
  before_action :require_admin, only: [:index]

  def index
    @users = User.all
  end

  def show
    if current_user.admin
      @user = User.find(params[:id])
    else 
      @user = User.find(current_user.id)
    end
  end

  def new
    @user = User.new
  end

  def edit
    if current_user.id != params[:id] && !current_user.admin
      redirect_to user_path(current_user)
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash.notice = "User #{@user.username} created!"
      redirect_to user_path(@user)
    else
      redirect_to new_user_path
    end
  end

  def update
    if @user.update(user_params)
      flash.notice = "User #{@user.username} updated!"
      redirect_to user_path(@user)
    else
      redirect_to edit_user_path
    end
  end

  def destroy
    @user.destroy
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end
