require 'rails_helper'

RSpec.describe Region, type: :model do
  let(:region) { build(:region) }

  describe "Attributes" do
    it { should respond_to(:name) }
  end

  describe "Relationships" do
    it { should have_many(:tickets) }
  end

  describe "Validations" do
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_least(1).is_at_most(255) }
    it { should validate_uniqueness_of(:name).case_insensitive }
  end

  describe "::unspecified" do
    it "creates an unspecified region if one does not exist" do
      expect(Region.where(name: "Unspecified")).to be_empty

      unspecified_region = Region.unspecified
      expect(Region.where(name: "Unspecified")).to include unspecified_region
    end

    it "cinds an unspecified region if one does exist" do
      unspecified_region = create(:region, :unspecified)

      expect(Region.where(name: "Unspecified")).to include unspecified_region
    end
  end

  describe "#to_s" do
    it "has a string representation that returns its name" do
      region.name = "FAKE"
      
      expect(region.to_s).to eq "FAKE"
    end
  end
end
