class ChefsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :set_chef, only: [:show, :edit, :update]

  def index
    @chefs = Chef.all
  end

  def show
    @chef = Chef.find(params[:id])
  end

  def new
    @chef = Chef.new
  end

  def create
    @chef = Chef.new(chef_params)
    @chef.user = current_user.id

    if @chef.save
      redirect_to @chef
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @chef.update(chef_params)
      redirect_to @chef
    else
      render :edit
    end
  end

  private

  def set_chef
    @chef = Chef.find(params[:id])
  end

  def chef_params
    params.require(:chef).permit(:name, :specialties, :biography, :availability, :location)
  end
end
