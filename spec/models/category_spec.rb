require 'rails_helper'

RSpec.describe Category, type: :model do
  context "validations" do
    it { is_expected.to validate_presence_of(:name)}
  end

  context "belongs_to" do
    it { is_expected.to  have_many(:coders) }
  end
end
