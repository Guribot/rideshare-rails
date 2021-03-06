class PassengersController < ApplicationController

  def index
    @passengers = Passenger.all.order(:name)
  end

  def new
    @passenger = Passenger.new
  end

  def create
    @passenger = Passenger.new(passenger_params)

    if @passenger.save
      redirect_to passengers_path
    else
      render :new
    end
  end

  def show
    @passenger = Passenger.find(params[:id])
    @trips = @passenger.trips
  end

  def edit
    @passenger = Passenger.find(params[:id])
  end

  def update
    @passenger = Passenger.find(params[:id])
    result = @passenger.update(passenger_params)

    if result
      redirect_to passenger_path(@passenger.id)
    else
      render :edit
    end
  end

  def destroy
    passenger = Passenger.find(params[:id])
    passenger.destroy
    redirect_to passengers_path
  end

  private
  def passenger_params
    return params.require(:passenger).permit(:name, :phone_num)
  end


end
