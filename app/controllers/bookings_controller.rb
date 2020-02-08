class BookingsController < ApplicationController
  before_action :set_booking, only: %i[show edit destroy update]

  def index
    @bookings = Booking.all
  end

  def new
    @booking = Booking.new
    authorize @booking
  end

  def show
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @meal = Meal.find(params[:meal_id])
    @booking.meal = @meal
    authorize @booking

    if @booking.save
      redirect_to meal_booking_path(@meal, @booking)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @booking.update(booking_params)
    redirect_to booking_path
  end

  def destroy
    @booking.destroy
    redirect_to bookings_path(@booking)
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def booking_params
    params.require(:booking).permit(%i[date time servings])
  end
end
