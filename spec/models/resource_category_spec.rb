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
end
