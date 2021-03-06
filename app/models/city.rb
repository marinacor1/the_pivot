class City < ActiveRecord::Base
  before_validation :assign_slug

  validates :name,  presence: true
  validates :state, presence: true
  validates :slug,  presence: true, uniqueness: true

  has_many :homes

  def to_param
    slug
  end

  def assign_slug
    self.slug ||= name_and_state.parameterize if name
  end

  def name_and_state
    "#{self.name}, #{self.state}"
  end
end
