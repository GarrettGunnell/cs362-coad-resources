require 'rails_helper'

RSpec.describe Organization, type: :model do
  let(:organization) { Organization.new }

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
end
