class ReservationDay < ActiveRecord::Base
  has_many :reservations
  has_many :days
end
