class Day < ActiveRecord::Base
  belongs_to :reservation
  has_one :home, through: :reservation

  validates :date,  presence: true

  def self.book(reservation)
    days = self.where(date: reservation.check_in..reservation.check_out)
    reservation.days << days
  end

end
