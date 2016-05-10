class Home < ActiveRecord::Base
  validates :address, presence: :true
  validates :image_url, presence: :true
  validates :title, presence: :true
  validates :description, presence: :true
  validates :daily_rate, presence: :true

  belongs_to :city
  belongs_to :user
end
