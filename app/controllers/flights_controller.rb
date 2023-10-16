class FlightsController < ApplicationController
  include SelectOptions

  # Params for search:
  # { "departure_airport_id"=>"101",
  #   "arrival_airport_id"=>"101",
  #   "flight_id"=>"101",
  #   "num_passengers"=>"1",
  #   "commit"=>"Search" }
  def index
    @flights = Flight.all
    @airports_options = options(Airport.all, :code, :id)
    @flights_options = options(Flight.all, :departure_time_formatted, :id)
    @num_passengers_options = (1..4).map { |n| [n, n] }
  end

  private

  def flight_params
    params.permit(:departure_airport_id, :arrival_airport_id,
                  :flight_id, :num_passengers)
  end
end
