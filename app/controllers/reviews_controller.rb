class ReviewsController < ApplicationController
  before_action :set_review, only: %i[show edit destroy update]

  def new
    @booking = Booking.find(params[:booking_id])
    @review = Review.new
    authorize @review
  end

  def create
    @review = Review.new(review_params)
    @booking = Booking.find(params[:booking_id])
    @review.booking = @booking
    authorize @review
    @review.save

    redirect_to meal_booking_path(@booking.meal, @booking)
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end

end
