class Review < ActiveRecord::Base
  belongs_to :home
  belongs_to :trip
  has_one :reservation
end
