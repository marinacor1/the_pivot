class Reservation < ActiveRecord::Base
  has_many :days
  belongs_to :home
end
