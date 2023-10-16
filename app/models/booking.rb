class Booking < ApplicationRecord
  belongs_to :flight, inverse_of: :bookings
  has_many :passengers, inverse_of: :booking

  accepts_nested_attributes_for :passengers, allow_destroy: true
end
