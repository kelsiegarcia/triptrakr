class LocationsController < ApplicationController
  before_action :find_trip
  before_action :get_location, only: [:show, :edit, :update]
  
  def index
    @locations = Location.all
  end

  def show
  end

  def new
    @location = @trip.locations.new
  end

  def create
    @location = @trip.locations.new(location_params)

    if @location.save
      redirect_to trip_location_path(@trip.id, @location.id)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @location.update(location_params)
      redirect_to trip_location_path(@trip.id, @location.id)
    else
      render :edit
    end
  end

  def destroy
    Location.find(params[:id]).destroy
    redirect_to trip_locations_path(@trip.id)
  end

  private

    def location_params
      params.require(:location).permit(:name, :description, :activity)
    end

    def find_trip
      @trip = Trip.find(params[:trip_id])
    end

    def get_location
      @location = @trip.locations.find(params[:id])
    end
  end
