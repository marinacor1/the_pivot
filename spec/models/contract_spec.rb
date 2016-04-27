require 'rails_helper'

describe Contract do
  context "belongs to" do
    it { is_expected.to belong_to(:user) }
  end

  context "has_many" do
    it { is_expected.to have_many(:teammates) }
    it { is_expected.to have_many(:coders) }
  end
end
