class MenusController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :set_user
  before_action :set_menu, only: [:show, :edit, :update, :destroy]

  def new
    @menu = Menu.new
  end

  def show
    @reviews = @menu.reviews.includes(:user)
    @booking = current_user.bookings.find_by(menu: @menu) if user_signed_in? && current_user.client?
  end

  def create
    @menu = @user.menus.new(menu_params)
    if @menu.save
      redirect_to user_path(@user)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authorize_menu_owner!
  end

  def update
    authorize_menu_owner!
    if @menu.update(menu_params)
      redirect_to user_path(@user)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    authorize_menu_owner!
    @menu.destroy
    redirect_to user_path(@user)
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_menu
    @menu = @user.menus.find(params[:id])
  end

  def menu_params
    params.require(:menu).permit(:title, :description, :price)
  end

  def authorize_menu_owner!
    redirect_to root_path, alert: 'You are not authorized to perform this action.' unless current_user == @user
  end
end
