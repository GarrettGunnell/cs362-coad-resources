require 'rails_helper'

RSpec.describe Organization, type: :model do
  let(:organization) { build(:organization) }

  describe "Attributes" do
    it { should respond_to(:name) }
    it { should respond_to(:status) }
    it { should respond_to(:email) }
    it { should respond_to(:phone) }
    it { should respond_to(:description) }
    it { should respond_to(:rejection_reason) }
    it { should respond_to(:liability_insurance) }
    it { should respond_to(:primary_name) }
    it { should respond_to(:secondary_name) }
    it { should respond_to(:secondary_phone) }
    it { should respond_to(:title) }
    it { should respond_to(:transportation) }
  end

  describe "Relationships" do
    it { should have_many(:users) }
    it { should have_many(:tickets) }
    it { should have_and_belong_to_many(:resource_categories) }
  end

  describe "Validations" do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:phone) }
    it { should validate_presence_of(:status) }
    it { should validate_presence_of(:primary_name) }
    it { should validate_presence_of(:secondary_name) }
    it { should validate_presence_of(:secondary_phone) }
    
    it { should validate_length_of(:email).is_at_least(1).is_at_most(255) }
    it { should allow_value("fake@example.com").for(:email) }
    it { should_not allow_value("fake").for(:email) }
    it { should validate_uniqueness_of(:email).case_insensitive }
    
    it { should validate_length_of(:name).is_at_least(1).is_at_most(255) }
    it { should validate_uniqueness_of(:name).case_insensitive }

    it { should validate_length_of(:description).is_at_most(1020) }
  end

  describe "#set_default_status" do
    it "sets an undefined status to submitted" do
      organization.set_default_status

      expect(organization.status).to eq "submitted"
    end

    it "does not set an already confirmed status" do
      organization.approve
      organization.set_default_status

      expect(organization.status).not_to eq "submitted"
    end
  end

  describe "#approve" do
    it "sets the status to approved" do
      organization.approve

      expect(organization.status).to eq "approved"
    end
  end

  describe "#reject" do
    it "sets the status to rejected" do
      organization.reject

      expect(organization.status).to eq "rejected"
    end
  end


  describe "#to_s" do
    it "has a string representation that returns its name" do
      organization.name = "FAKE"
      
      expect(organization.to_s).to eq "FAKE"
    end
  end
end
