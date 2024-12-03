class ReviewsController < ApplicationController
  before_action :authenticate_user! # filtre qui exige que l'user soit co pour pouvoir accéder au controller

  # Créer un review
  def create
    @chef = Chef.find(params[:chef_id])
    @booking = Booking.find(params[:booking_id])  # Trouve la réservation associée
    @review = @booking.reviews.new(review_params) # Crée instance de Review associée à la résa
    @review.user = current_user  # Associe l'avis à l'user co
    @review.chef = @chef  # Associe l'avis au chef

    if @review.save
      redirect_to chef_path(@chef)
    else
      redirect_to chef_path(@chef)
    end
  end

  # Modifier un review
  def edit
    @review = Review.find(params[:id])
    if @review.user != current_user # vérifie que l'user co est l'auteur de l'avis
      redirect_to chef_path(@review.chef)
    end
  end

  # update le review
  def update
    @review = Review.find(params[:id])
    if @review.user == current_user && @review.update(review_params) # Vérifie que le user co est l'auteur et mets à jour la review avec les bons params
      redirect_to chef_path(@review.chef)
    else
      render :edit
    end
  end

  # delete review
  def destroy
    @review = Review.find(params[:id])
    if @review.user == current_user # vérifie que l'user co est l'auteur de l'avis
      @review.destroy
      redirect_to chef_path(@review.chef)
    else
      redirect_to chef_path(@review.chef)
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :comment)
  end
end
