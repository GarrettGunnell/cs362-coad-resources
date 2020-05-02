require 'rails_helper'

RSpec.describe ResourceCategory, type: :model do
  let(:resourcecategory) { build(:resourcecategory) }

  describe "Attributes" do
    it { should respond_to(:name) }
    it { should respond_to(:active) }
  end

  describe "Relationships" do
    it { should have_and_belong_to_many(:organizations) }
    it { should have_many(:tickets) }
  end
  
  describe "Validations" do
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_least(1).is_at_most(255) }
    it { should validate_uniqueness_of(:name).case_insensitive }
  end

  describe "::unspecified" do
    it "Creates an unspecified resource category if one does not exist" do
      expect(ResourceCategory.where(name: "Unspecified")).to be_empty

      unspecified_resourcecategory = ResourceCategory.unspecified
      expect(ResourceCategory.where(name: "Unspecified")).to include unspecified_resourcecategory
    end

    it "Finds an unspecified resource category if one does exist" do
      unspecified_resourcecategory = create(:resourcecategory, :unspecified)

      expect(ResourceCategory.where(name: "Unspecified")).to include unspecified_resourcecategory
    end
  end

  describe "#activate" do
    it "sets active attribute to true" do
      resourcecategory.activate
      expect(resourcecategory.active).to eq true
    end
  end

  describe "#deactivate" do
    it "sets active attribute to false" do
      resourcecategory.deactivate
      expect(resourcecategory.active).to eq false
    end
  end

  describe "#inactive?" do
    it "returns true if active attribute is false" do
      resourcecategory.active = false
      expect(resourcecategory.inactive?).to eq true
    end

    it "returns false if active attribute is true" do
      resourcecategory.active = true
      expect(resourcecategory.inactive?).to eq false
    end
  end

  describe "#to_s" do
    it "has a string representation that returns its name" do
      resourcecategory.name = "FAKE"
      expect(resourcecategory.to_s).to eq "FAKE"
    end
  end
end
