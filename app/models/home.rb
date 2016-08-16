class Home < ActiveRecord::Base
  has_many :users
  has_many :reviews
  validates :address, presence: :true, uniqueness: true
  validates :image_url, presence: :true
  validates :title, presence: :true
  validates :description, presence: :true
  validates :daily_rate, presence: :true

  belongs_to :city
  has_many :reservations
  has_many :days, through: :reservations

  def find_reviews

  end
end
