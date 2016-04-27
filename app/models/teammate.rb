class Teammate < ActiveRecord::Base
  belongs_to :coder
  belongs_to :contract

  validates :cost, presence: true

end
