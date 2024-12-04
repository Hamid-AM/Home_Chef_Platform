# app/controllers/menus_controller.rb
class MenusController < ApplicationController
  before_action :set_menu, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # Show all available menus (for both chefs and clients)
  def index
    @menus = Menu.all
  end

  # Show a single menu's details
  def show
  end

  # Only chefs can create menus
  def new
    @menu = Menu.new
  end

  def create
    @menu = Menu.new(menu_params)
    @menu.user = current_user # Manually assign the current user as the chef
    if @menu.save
      redirect_to user_path(current_user), notice: 'Menu created successfully.'
    else
      render :new
    end
  end

  # Only chefs can edit menus
  def edit
  end

  def update
    if @menu.update(menu_params)
      redirect_to user_path(current_user), notice: 'Menu updated successfully.'
    else
      render :edit
    end
  end

  # Only chefs can delete menus
  def destroy
    @menu.destroy
    redirect_to user_path(current_user), notice: 'Menu deleted successfully.'
  end

  private

  def set_menu
    @menu = Menu.find(params[:id])
  end

  def menu_params
    params.require(:menu).permit(:title, :description, :price)
  end
end
