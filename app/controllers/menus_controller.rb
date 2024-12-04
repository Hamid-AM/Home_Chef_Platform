class MenusController < ApplicationController
  before_action :set_chef
  before_action :set_menu, only: [:show, :edit, :update, :destroy]

  def index
    @menus = @chef.menus
  end

  def show
  end

  def new
    @menu = @chef.menus.new
  end

  def create
    @menu = @chef.menus.new(menu_params)
    if @menu.save
      redirect_to chef_menu_path(@chef, @menu)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @menu.update(menu_params)
      redirect_to chef_path(@chef, @menu)
    else
      render :edit
    end
  end

  def destroy
    @menu.destroy
    redirect_to chef_path(@chef)
  end

  private

  def set_chef
    @chef = Chef.find(params[:chef_id])
  end

  def set_menu
    @menu = @chef.menus.find(params[:id])
  end

  def menu_params
    params.require(:menu).permit(:title, :description, :price)
  end
end
