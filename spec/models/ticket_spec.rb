require 'rails_helper'

RSpec.describe Ticket, type: :model do
  let(:ticket) {build(:ticket)}

  describe "Attributes" do
    it { should respond_to(:name)}
    it { should respond_to(:phone)}
    it { should respond_to(:region_id)}
    it { should respond_to(:resource_category_id)}
  end

  describe "Relationships" do
    it {should belong_to(:region)}
    it {should belong_to(:resource_category)}
    it {should belong_to(:organization)}
  end

  describe "Validations" do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:phone)}
    it {should validate_presence_of(:region_id)}
    it {should validate_presence_of(:resource_category_id)}

    it {should validate_length_of(:name).is_at_least(1).is_at_most(255)}
    it {should validate_length_of(:description).is_at_most(1020)}
    it {should validate_length_of(:phone), "10"}
  end

end
