class FlightsController < ApplicationController
  def index
    @flights = Flight.all
    @flight_options = @flights.collect do |flight|
      [flight.departure_time, flight.id]
    end

    @num_passengers_options = (1..4).map { |n| [n, n] }
  end
end
