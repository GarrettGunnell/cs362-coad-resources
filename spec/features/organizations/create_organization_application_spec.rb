require 'rails_helper'

RSpec.describe 'Creating an Organization Application', type: :feature do

    before :each do
        @user = create(:user)
    end

    it "displays an application submitted message" do
        log_in_as @user
        visit new_organization_application_path
        
    end
end
