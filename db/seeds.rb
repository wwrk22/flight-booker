# Airports
Airport.destroy_all

# Clear the record of unique values returned because unique values ARE limited.
Faker::Name.unique.clear

100.times do
  Airport.create!({ code: Faker::Name.unique.initials(number: 3) })
end

p "Created #{Airport.count} airports"


# Flights

