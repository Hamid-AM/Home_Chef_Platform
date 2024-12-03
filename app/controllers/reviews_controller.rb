class ReviewsController < ApplicationController

  before_action :set_booking, only: [:create]
  before_action :set_review, only: [:edit, :update, :destroy]

  def create
    @review = @booking.reviews.new(review_params)
    @review.user = current_user
    if @review.save
      redirect_to @booking
    else
      redirect_to @booking, alert: 'Failed to create review.'
    end
  end

  def edit
  end

  def update
    if @review.update(review_params)
      redirect_to @review.booking
    else
      render :edit
    end
  end

  def destroy
    @review.destroy
    redirect_to @review.booking
  end

  private

  def set_booking
    @booking = Booking.find(params[:booking_id])
  end

  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:rating, :comment)
  end
end
