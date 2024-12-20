# app/controllers/bookings_controller.rb
class BookingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user
  before_action :set_booking, only: [:update]

  def index
    if current_user.client?
      @bookings = current_user.bookings.includes(:menu)
    elsif current_user.chef?
      @bookings = Booking.joins(:menu).where(menus: { user_id: current_user.id })
    end
  end

  def new
    @menu = Menu.find(params[:menu_id]) # Trouver le menu en fonction de l'ID
    @booking = @menu.bookings.build(user: current_user) # Associer le menu et l'utilisateur
  end

  def create
    @menu = Menu.find(params[:menu_id])
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.menu = @menu
    @booking.total_price = @menu.price # Default price is based on the menu price

    if @booking.save
      redirect_to user_bookings_path
    else
      redirect_to user_path(@menu.user)
    end
  end

  def update
    if current_user.chef? && @booking.menu.user == current_user
      @booking.update(status: params[:status])
      redirect_to user_bookings_path
    else
      redirect_to root_path
    end
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:date, :time, :notes)
  end
end
