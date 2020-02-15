class MealsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_meal, only: %i[show edit destroy update]

  def index
    @meals = policy_scope(Meal)
    @meals = @meals.geocoded #returns flats with coordinates

    @markers = @meals.map do |meal|
      {
        lat: meal.latitude,
        lng: meal.longitude,
        infoWindow: render_to_string(partial: "map_box", locals: { meal: meal })
      }
    end
    if params[:query].present?
      sql_query = "title ILIKE :query OR category ILIKE :query"
      @meals = Meal.where(sql_query, query: "%#{params[:query]}%")
    else
      @meals = Meal.all
    end
  end


  def show
    #@reviews = @meal.reviews
    #authorize @reviews
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
    authorize @meal
  end

  def update
    authorize @meal
    @meal.update(meal_params)

    redirect_to meal_path(@meal)
  end

  def destroy
    authorize @meal
    @meal.destroy
    redirect_to meals_path
  end

  private

  def set_meal
    @meal = Meal.find(params[:id])
  end

  def meal_params
    params.require(:meal).permit(%i[title description category price address cooking_time photo])
  end
end
