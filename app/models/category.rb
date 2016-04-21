class Category < ActiveRecord::Base
  before_validation :assign_slug

  validates :name, presence: true, uniqueness: true
  validates :slug, presence: true, uniqueness: true

  has_many :coders

  def to_param
    slug
  end

  def assign_slug
    self.slug ||= name.parameterize if name
  end
end
