# Flight has an Airport foreign key, so order matters here.
Flight.destroy_all
Airport.destroy_all

# -- Airports --

100.times do
  Airport.create!({ code: Faker::Name.unique.initials(number: 3) })
end

p "Created #{Airport.count} airports"


# -- Flights --

# Time in seconds
thirty_minutes = 1_800
fifteen_hours = 54_000
duration_range = (thirty_minutes..fifteen_hours)

# All airport ids
airport_ids = Airport.pluck :id

100.times do
  # Pick two random airports
  departure_airport_id = airport_ids.delete(airport_ids.sample)
  arrival_airport_id = airport_ids.sample

  Flight.create!({ duration: Faker::Number.within(range: duration_range),
                   departure_time: Faker::Time.forward(days: 300),
                   departure_airport_id: departure_airport_id,
                   arrival_airport_id: arrival_airport_id })

  # Make sure to reset to include all ids for the next flight
  airport_ids << departure_airport_id
end

p "Created #{Flight.count} flights"
