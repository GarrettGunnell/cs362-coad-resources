require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) {build(:user)}

  describe "Attributes" do
    it {should respond_to(:email)}
    it {should respond_to(:password)}
    it {should respond_to(:role)}
  end

  describe "Relationships" do
    it {should belong_to(:organization)}
  end

  describe "Validations" do
    it {should validate_presence_of(:email)}
    it {should validate_length_of(:email).is_at_least(1).is_at_most(255)}
    # it {should validateFORMAT?}
    it {should validate_uniqueness_of(:email).case_insensitive}
    it {should validate_presence_of(:password)}
    it {should validate_length_of(:password).is_at_least(7).is_at_most(255)}
  end

  
end
