class Day < ActiveRecord::Base
  validates :date,  presence: true

  belongs_to :reservation
  has_many :homes, through: :reservation

end
