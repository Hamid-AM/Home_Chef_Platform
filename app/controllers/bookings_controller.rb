class BookingsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :show]
  before_action :set_menu, only: [:new, :create]

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.menu = @menu

    if @booking.save
      redirect_to @booking
    else
      render :new
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  private

  def set_menu
    @menu = Menu.find(params[:menu_id])
  end

  def booking_params
    params.require(:booking).permit(:date, :status, :notes, :menu_id)
  end
end
