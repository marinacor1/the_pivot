class Reservation < ActiveRecord::Base
  belongs_to :home
  has_many :reservation_days
  has_many :days, through: :reservation_days

end
