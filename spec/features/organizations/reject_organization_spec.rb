require 'rails_helper'

RSpec.describe 'Rejecting an organization', type: :feature do
    before :each do
        @user = create(:user, :admin)
        @organization = create(:organization, :submitted)
    end

    it "Displays an organization rejected message" do
        log_in_as @user
        visit organizations_path
        click_on 'Review'
        click_on 'Reject'
        expect(page).to have_text('has been rejected')
    end
end
