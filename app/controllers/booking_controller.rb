class BookingsController < ApplicationController
  before_action :set_booking, only: [ :show,:destroy, :update ]

  def new
    @booking = Booking.new
    @car = Car.find(params[:car_id])
  end

  def show
    @car = Car.find(params[:car_id])
    @booking.car = @car
  end

  def create
    @booking = Booking.new(booking_params)
    @car = Car.find(params[:car_id])
    @booking.plane = @car
    @booking.user = current_user
    if @booking.save
      redirect_to car_booking_path(@car, @booking)
    else
      render :new
    end
  end

  def update
    @booking.update(confirmation: 'true')
    redirect_to dashboard_path
  end

  def destroy
    @booking.destroy
    redirect_to dashboard_path, anchor: "two-panel"
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :confirmation, :user_id, :plane_id)
  end
end
