class AddressesController < ApplicationController
   before_action :find_location
  before_action :get_address, only: [:show, :edit, :update]
  
  def index
    @addresses = Address.all
  end

  def show
  end

  def new
    @address = @location.addresses.new
  end

  def create
    @address = @location.addresses.new(address_params)

    if @address.save
      redirect_to location_address_path(@location.id, @address.id)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @address.update(address_params)
      redirect_to location_address_path(@location.id, @address.id)
    else
      render :edit
    end
  end

  def destroy
    Address.find(params[:id]).destroy
    redirect_to address_path
  end

  private

    def address_params
      params.require(:address).permit(:name, :description, :completed)
    end

    def find_location
      @location = Location.find(params[:location_id])
    end

    def get_address
      @address = @location.addresses.find(params[:id])
    end
end
