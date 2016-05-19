class Reservation < ActiveRecord::Base
  belongs_to :home
  belongs_to :trip
  has_many :days

  def double_booked_days
    Home.find(home_id).days.pluck(:date) & (check_in.to_date..check_out.to_date).to_a
  end

  def trip_length
    (self.check_out - self.check_in).to_i + 1
  end
end
