class Reservation < ActiveRecord::Base
  belongs_to :home
  has_many :days

  def has_no_conflicts?
    return true unless self.days.any? { |day| !day.available? }
  end

end
