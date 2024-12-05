class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.where(role: 'chef')
    if params[:query].present?
      @chefs = @chefs.where('name ILIKE ? OR location ILIKE ?', "%#{params[:query]}%", "%#{params[:query]}%")
    end
  end

  def show
    @user = User.find(params[:id])
    @menus = @user.menus
    @is_chef = @user.chef?
    @is_client = user_signed_in? && current_user.client?
  end
end
