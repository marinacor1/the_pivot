require 'rails_helper'

RSpec.describe City, type: :model do
  context "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:state) }
    it { is_expected.to validate_presence_of(:slug) }
  end
end
