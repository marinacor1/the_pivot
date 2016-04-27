require 'rails_helper'

RSpec.describe Category, type: :model do
  context "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:slug) }
  end

  context "validates uniqueness of slug" do
    it { is_expected.to validate_uniqueness_of(:slug) }
  end

  context "belongs_to" do
    it { is_expected.to  have_many(:coders) }
  end

  it "generates a slug when it's created" do
    category = Category.create!(name: "Big Data")

    expect(category.slug).to eq("big-data")
  end
end
