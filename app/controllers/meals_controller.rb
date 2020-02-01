class MealsController < ApplicationController
  # before_action :set_meal, only: %i[show edit destroy update]

  def index
    @meals = Meal.all
  end

  def new
    @meal = Meal.new
  end

  def create
    @meal = Meal.new(meal_params)
    if @meal.save
      redirect_to meal_path(@meal)
    else
      render :new
    end
  end

  private

  def set_meal
    @meal = Meal.find(params[:id])
  end
end
