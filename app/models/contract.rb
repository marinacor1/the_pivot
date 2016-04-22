class Contract < ActiveRecord::Base
  serialize :teammates_ids
  belongs_to :user
end
