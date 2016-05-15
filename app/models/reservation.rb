class Reservation < ActiveRecord::Base
  belongs_to :home
  has_many :days

  def has_no_conflicts?
    # will now change due to pending process
    return true unless self.days.any? { |day| !day.available? }
  end

  def trip_length
    (self.check_out - self.check_in).to_i
  end
end
