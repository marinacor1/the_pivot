class Review < ActiveRecord::Base
  belongs_to :home
  belongs_to :trip
  has_one :reservation

  validates :title, presence: true
  validates :thoughts, presence: true
end
