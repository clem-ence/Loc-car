class CarsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  before_action :set_plane, only: [:show, :edit, :destroy]

  def index
    if params[:query].present?
      sql_query = "name ILIKE :query OR localisation ILIKE :query OR users.first_name ILIKE :query"
      @cars = Car.joins(:user).where(sql_query, query: "%#{params[:query]}%")
    else
      @cars = Car.where(available: 'true')
    end
  end

  def show
    @car = Car.find(params[:id])
    @booking = Booking.new
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(plane_params)
    @user = current_user
    @car.user = @user

    if @car.save
      redirect_to dashboard_path(@user)
    else
      render :new
    end
  end

  def edit
    @car = Car.find(params[:id])
  end

  def update
    @car = Car.find(params[:id])
    @user = current_user
    if @car.update(plane_params)
      redirect_to dashboard_path(@user)
    else
      render :edit
    end
  end

  def destroy
    @car = Car.find(params[:id])
    @car.destroy
    redirect_to dashboard_path(@user)
  end

  private

  def plane_params
    params.require(:car).permit(:name, :capacity, :price_per_day, :localisation, :available, :description, photos: [])
  end

  def set_plane
    @car = Car.find(params[:id])
  end
end
