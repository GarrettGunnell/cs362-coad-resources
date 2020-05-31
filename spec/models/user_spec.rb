require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build(:user) }

  describe "Attributes" do
    it { should respond_to(:email) }
    it { should respond_to(:encrypted_password) }
    it { should respond_to(:reset_password_token) }
    it { should respond_to(:reset_password_sent_at) }
    it { should respond_to(:remember_created_at) }
    it { should respond_to(:confirmation_token) }
    it { should respond_to(:confirmed_at) }
    it { should respond_to(:confirmation_sent_at) }
    it { should respond_to(:unconfirmed_email) }
    it { should respond_to(:role) }
    it { should respond_to(:organization_id) }
  end

  describe "Relationships" do
    it { should belong_to(:organization) }
  end

  describe "Validations" do
    it { should validate_presence_of(:email) }
    it { should validate_length_of(:email).is_at_least(1).is_at_most(255) }
    it { should allow_value("fake@example.com").for(:email) }
    it { should_not allow_value("fake").for(:email) }
    it { should validate_uniqueness_of(:email).case_insensitive }
    it { should validate_presence_of(:password) }
    it { should validate_length_of(:password).is_at_least(7).is_at_most(255) }
  end

  describe "#set_default_role" do 
    it "sets the user's role to organization if the role is undefined" do
      user.role = nil
      user.set_default_role

      expect(user.role).to eq "organization"
    end

    it "does not set the user's role if the role is already set" do
      user.role = "admin"
      user.set_default_role

      expect(user.role).not_to eq "organization"
      expect(user.role).to eq "admin"
    end
  end

  describe "#to_s" do
    it "has a string representation that returns its email" do
      user.email = "fake@example.com"
      
      expect(user.to_s).to eq "fake@example.com"
    end
  end
end
