class BookingsController < ApplicationController
  def new
    @booking = Booking.new(new_booking_params)
    @flight = @booking.flight
    params[:num_passengers].to_i.times { @booking.passengers.build }
  end

  def create
    @booking = Booking.new(create_booking_params)
  end

  def show
  end

  private

  def new_booking_params
    params.permit(:flight_id)
  end
end
