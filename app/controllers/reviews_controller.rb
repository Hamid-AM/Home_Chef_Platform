# app/controllers/reviews_controller.rb
class ReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_menu, only: [:create]
  before_action :set_booking, only: [:create]
  before_action :authorize_client!, only: [:create]

  def create
    @review = Review.new(review_params)
    @review.user = current_user
    @review.menu = @menu
    @review.booking = @booking

    if @review.save
      redirect_to menu_path(@menu), notice: 'Review submitted successfully.'
    else
      redirect_to menu_path(@menu), alert: 'Failed to submit review. Please check your inputs.'
    end
  end

  private

  def set_menu
    @menu = Menu.find(params[:menu_id])
  end

  def set_booking
    @booking = Booking.find_by(user: current_user, menu: @menu)
    redirect_to menu_path(@menu), alert: 'You can only review menus you have booked.' unless @booking
  end

  def authorize_client!
    redirect_to root_path, alert: 'Only clients can leave reviews.' unless current_user.client?
  end

  def review_params
    params.require(:review).permit(:rating, :comment)
  end
end
