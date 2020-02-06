class MealsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  before_action :set_meal, only: %i[show edit destroy update]

  def index
    @meals = policy_scope(Meal)
  end

  def show
    authorize @meal
  end

  def new
    @meal = Meal.new
    authorize @meal
  end

  def create
    @meal = Meal.new(meal_params)
    @meal.user = current_user

    authorize @meal

    if @meal.save
      redirect_to meal_path(@meal)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @meal.update(meal_params)

    redirect_to meal_path(@meal)
  end

  def destroy
    @meal.destroy
    redirect_to meals_path
  end

  private

  def set_meal
    @meal = Meal.find(params[:id])
  end

  def meal_params
    params.require(:meal).permit(%i[title description category price cooking_time photo])
  end
end
