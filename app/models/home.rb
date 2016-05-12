class Home < ActiveRecord::Base
  validates :address, presence: :true, uniqueness: true
  validates :image_url, presence: :true
  validates :title, presence: :true
  validates :description, presence: :true
  validates :daily_rate, presence: :true


  belongs_to :city
  belongs_to :user
  has_many :reservations
  has_many :reservation_days, through: :reservations
end
