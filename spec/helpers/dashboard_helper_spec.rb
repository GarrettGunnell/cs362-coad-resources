require 'rails_helper'

RSpec.describe DashboardHelper, type: :helper do

    it "returns application_creation_dashboard" do
      user = double()
      user = User.new()
      expect(dashboard_for(user)).to eq('create_application_dashboard')
    end

    it "returns admin_dashboard" do
      user = double()
      user.stub(:admin?).and_return(true)
      expect(dashboard_for(user)).to eq('admin_dashboard')
    end

    it "returns org_submitted_dashboard" do
      User.any_instance.stub(:admin?).and_return(false)
      user = User.new
      user.stub_chain(:organization, :submitted?).and_return(true)
      expect(dashboard_for(user)).to eq('organization_submitted_dashboard')
    end

    # it "returns org_apporved_dashboard" do
    #   User.any_instance.stub(:organization).and_return(false)
    #   user = User.new
    #   user.stub_chain(:organization, :approved?).and_return(true)
    #   expect(dashboard_for(user)).to eq('organization_approved_dashboard')
    # end


end
