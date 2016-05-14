class Day < ActiveRecord::Base
  belongs_to :reservation

  validates :date,  presence: true

  # validates_uniqueness_of :date, scope: :reservation_id

  scope :available?, ->{ where(available: true) }

  def available?
    reservation_id.nil?
  end

  def self.book(reservation)
    days = self.where(date: reservation.check_in..reservation.check_out)
    reservation.days << days
  end

end
