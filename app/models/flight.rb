class Flight < ApplicationRecord
  include Filterable

  belongs_to :departure_airport,
             class_name: "Airport",
             inverse_of: :departure_flights
  belongs_to :arrival_airport,
             class_name: "Airport",
             inverse_of: :arrival_flights

  scope :with_departure_airport_id, -> (airport_id) do
    where(departure_airport_id: airport_id)
  end
  scope :with_arrival_airport_id, -> (airport_id) do
    where(arrival_airport_id: airport_id)
  end

  def departure_time_formatted
    self[:departure_time].strftime("%Y-%m-%d")
  end
end
