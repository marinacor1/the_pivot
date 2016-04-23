require 'rails_helper'

describe Contract do
  context "serializations" do
    it { is_expected.to serialize(:teammates_ids) }
  end

  context "belongs to" do
    it { is_expected.to belong_to(:user) }
  end
end
