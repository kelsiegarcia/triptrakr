class TripsController < ApplicationController
  before_action :trip, only: [:edit, :show, :update, :destroy]

  def index
    @trips = Trip.all
  end

  def show
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(trip_params)
    if trip.save
      redirect_to trips_path(trip)
    else
      render :new  
    end
  end

  def edit
  end

  def update
    if @trip.update(trip_params)
      redirect_to trips_path(@trip)
    else
      render :edit
    end
  end

  def destroy
    if @trip.destroy
      redirect_to trips_path
    else
      #TODO add path
    end
  end

  private

  def trip_params
    params.require(:trip)
      .permit(
        :title,
        :date_beginning,
        :date_end,
        :description
      )
  end

  def trip
    @trip = Trip.find_by(id: params[:id])
  end
end
