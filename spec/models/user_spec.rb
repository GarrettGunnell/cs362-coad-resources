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
  end
end
