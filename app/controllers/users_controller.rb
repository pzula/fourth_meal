class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :require_login, except: [:new, :create, :edit]
  before_action :require_admin, only: [:index, :dashboard]

  def dashboard
    @items = Item.all
    @categories = Category.all
    @orders = Order.all
    @users = User.all
    @restaurants = Restaurant.all
    @pending_restaurants = Restaurant.where(status: "pending")
  end

  def index
    @users = User.all
  end

  def show
    @order = current_order
    if current_user.admin
      @user = User.find(params[:id])
    else
      @user = User.find(current_user.id)
    end
    @recent_orders = Order.where(user_id: current_user.id)
    if current_user.admin?
      @restaurants = Restaurant.all
    else
      if current_user.restaurants 
        @restaurants = current_user.restaurants
      end
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
      auto_login(@user)
      flash.notice = "User #{@user.username} created!"
      UserMailer.welcome_email(@user).deliver
      redirect_to root_path
    else
      flash.notice = "There was an error"
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
    redirect_to users_path
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end
