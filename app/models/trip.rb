class Trip < ActiveRecord::Base
  has_many :reservations
  belongs_to :user

  def word_date(date)
    date.strftime("%b %d, %Y")
  end
end
