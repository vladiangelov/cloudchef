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
    @meal.user = current_user
    if @meal.save
      redirect_to meal_path(@meal)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @meal.update(meals_params)

    redirect_to meal_path(@meal)
  end

  private

  def set_meal
    @meal = Meal.find(params[:id])
  end

  def meals_params
    params.require(:meal).permit(%i[title description category price cooking_time])
  end
end
