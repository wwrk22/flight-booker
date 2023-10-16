class FlightsController < ApplicationController
  include SelectOptions

  before_action :index, :set_flight_search_results

  def index
    @airports_options = options(Airport.all, :code, :id)
    @flights_options = options(Flight.order(:departure_time),
                               :departure_time_ymd, :departure_time_ymd).uniq
    @num_passengers_options = (1..4).map { |n| [n, n] }
  end

  private

  def flight_params
    params.permit(:departure_airport_id, :arrival_airport_id,
                  :departure_time, :num_passengers)
  end

  def search_flight_params
    search_params = flight_params.select do |key, value|
      allowed_params = %i[departure_airport_id arrival_airport_id departure_time]
      allowed_params.include? key.to_sym
    end
    search_params[:departure_time] = Time.zone.parse(search_params[:departure_time])
    search_params
  end

  def set_flight_search_results
    if params[:commit] == "Search"
      @flights = Flight.filter(search_flight_params)
    end
  end
end
