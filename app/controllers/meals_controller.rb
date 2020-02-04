class MealsController < ApplicationController
  before_action :set_meal, only: %i[show edit destroy update]

  def index
    @meals = Meal.all
  end

  def new
    @meal = Meal.new
  end

  def show
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

  def destroy
    @meal.destroy
    redirect_to meals_path
  end

  private

  def set_meal
    @meal = Meal.find(params[:id])
  end

  def meals_params
    params.require(:meal).permit(%i[title description category price cooking_time])
  end
end