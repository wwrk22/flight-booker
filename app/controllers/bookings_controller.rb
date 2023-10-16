class BookingsController < ApplicationController
  def new
    @booking = Booking.new(new_booking_params)
    @flight = @booking.flight
    params[:num_passengers].to_i.times { @booking.passengers.build }
  end

  def create
    @booking = Booking.new(create_booking_params)

    if @booking.save
      redirect_to @booking, notice: "Booking successful"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  private

  def new_booking_params
    params.permit(:flight_id)
  end

  def create_booking_params
    params.require(:booking).permit(:flight_id, :passengers_attributes => [:name, :email])
  end
end
