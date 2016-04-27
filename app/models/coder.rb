class Coder < ActiveRecord::Base
  validates :name, presence: :true
  validates :image_url, presence: :true
  validates :experience, presence: :true
  validates :cost, presence: :true

  belongs_to :category
  has_many :teammates
  has_many :contracts, through: :teammates
end
