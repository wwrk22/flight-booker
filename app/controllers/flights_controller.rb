class FlightsController < ApplicationController
  include SelectOptions

  def index
    @flights = Flight.all
    @airports_options = options(Airport.all, :code, :id)
    @flights_options = options(Flight.all, :departure_time_formatted, :id)
    @num_passengers_options = (1..4).map { |n| [n, n] }
  end
end
