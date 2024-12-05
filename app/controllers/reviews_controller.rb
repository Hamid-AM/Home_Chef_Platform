class ReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_menu, only: [:create]

  def create
    @review = Review.new(review_params)
    @review.user = current_user
    @review.menu = @menu
    @review.booking = Booking.find_by(menu: @menu, user: current_user)
    if @review.booking && @review.save
      redirect_to user_path(@menu.user)
    else
      render user_path(@menu.user), status: :unprocessable_entity
    end
  end

  private

  def set_menu
    @menu = Menu.find(params[:menu_id])
  end

  def review_params
    params.require(:review).permit(:rating, :comment)
  end
end
