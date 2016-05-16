class Day < ActiveRecord::Base
  belongs_to :reservation

  validates :date,  presence: true

  def available?
    reservation_id.nil?
  end

  def self.book(reservation)
    days = self.where(date: reservation.check_in..reservation.check_out)
    reservation.days << days
  end

end
