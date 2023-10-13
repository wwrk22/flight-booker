class Flight < ApplicationRecord
  belongs_to :departure_airport,
             class_name: "Airport",
             inverse_of: :departure_flights
  belongs_to :arrival_airport,
             class_name: "Airport",
             inverse_of: :arrival_flights
end
