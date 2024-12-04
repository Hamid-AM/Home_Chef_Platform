# app/controllers/bookings_controller.rb
class BookingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_booking, only: [:update]

  def create
    @menu = Menu.find(params[:menu_id])
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.menu = @menu
    @booking.total_price = @menu.price # Default price is based on the menu price

    if @booking.save
      redirect_to bookings_path, notice: 'Booking successfully created.'
    else
      redirect_to menu_path(@menu), alert: 'Unable to create booking.'
    end
  end

  def index
    if current_user.client?
      @bookings = current_user.bookings.includes(:menu)
    elsif current_user.chef?
      @bookings = Booking.joins(:menu).where(menus: { user_id: current_user.id })
    end
  end

  def update
    if current_user.chef? && @booking.menu.user == current_user
      @booking.update(status: params[:status])
      redirect_to bookings_path, notice: 'Booking status updated.'
    else
      redirect_to root_path, alert: 'Unauthorized action.'
    end
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:date, :time, :notes)
  end
end
