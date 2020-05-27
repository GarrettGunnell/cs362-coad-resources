require 'rails_helper'

RSpec.describe 'Approving an organization', type: :feature do

    before :each do
        @user = create(:user, :admin)
        @organization = create(:organization, :submitted)
    end

    it "Displays an organization approved message" do
        log_in_as @user
        visit '/organizations'
        click_on 'Review'
        click_on 'Approve'
        expect(page).to have_text('has been approved')
    end
end
