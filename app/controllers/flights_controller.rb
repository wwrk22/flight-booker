class FlightsController < ApplicationController
  def index
    @airports_options = Airport.all.map do |airport|
      [airport.code, airport.id]
    end

    @flights = Flight.all
    @flights_options = @flights.collect do |flight|
      [flight.departure_time, flight.id]
    end

    @num_passengers_options = (1..4).map { |n| [n, n] }
  end
end
