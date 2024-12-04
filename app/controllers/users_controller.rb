class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    if params[:query].present?
      @chefs = User.where(role: 'chef').where('name ILIKE ?', "%#{params[:query]}%")
    else
      @chefs = User.where(role: 'chef')
    end
  end

  def show
    @user = User.find(params[:id])
    if @user.role == 'chef'
      @menus = @user.menus
    else
      @menus = Menu.all
    end
  end
end
