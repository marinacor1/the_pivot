require 'rails_helper'

RSpec.describe Coder, type: :model do
  context "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:image_url) }
    it { is_expected.to validate_presence_of(:experience) }
    it { is_expected.to validate_presence_of(:cost) }
  end

  context "belongs_to" do
    it { is_expected.to  belong_to(:category) }
  end

  context "has_many" do
    it {is_expected.to have_many(:contracts).with_foreign_key(:coder_id)}
  end
end
