class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @chefs = User.where(role: 'chef')

    # Filtrage par nom si la query est présente
    if params[:query].present?
      @chefs = @chefs.where('name ILIKE ?', "%#{params[:query]}%")
    end

    # Filtrage par spécialité si elle est sélectionnée
    if params[:specialty].present?
      @chefs = @chefs.where(specialties: params[:specialty])
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
