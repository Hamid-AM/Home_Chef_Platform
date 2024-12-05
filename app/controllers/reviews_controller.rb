class ReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_menu, only: [:create]

  def create
    @review = @menu.reviews.new(review_params)
    @review.user = current_user
    if Booking.exists?(menu: @menu, user: current_user)
      if @review.save
        redirect_to user_path(@menu.user)
      end
    else
      redirect_to user_path(@menu.user)
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
