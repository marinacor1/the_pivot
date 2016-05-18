class Home < ActiveRecord::Base
  has_many :users
  validates :address, presence: :true, uniqueness: true
  validates :image_url, presence: :true
  validates :title, presence: :true
  validates :description, presence: :true
  validates :daily_rate, presence: :true

  belongs_to :city
  has_many :reservations
  has_many :days, through: :reservations

  def pending_homes?
    @homes = Home.all
    @pending_homes = @homes.map do |home|
      home.pending?
    end
  end

end
