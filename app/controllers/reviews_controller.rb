class ReviewsController < ApplicationController
  before_action :set_review, only: %i[show edit destroy update]

  def new
    @meal = Meal.find(params[:meal_id])
    @review = Review.new
    authorize @review
  end


  def create
    @review = Review.new(review_params)
    @meal = Meal.find(params[:meal_id])
    @review.meal = @meal
    @review.user = current_user
    authorize @review
    @review.save

    redirect_to meal_path(@meal)
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end

end
