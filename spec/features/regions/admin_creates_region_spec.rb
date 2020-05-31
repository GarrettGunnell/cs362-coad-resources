require 'rails_helper'

RSpec.describe 'Creating a Region', type: :feature do
    
    before :each do
        @user = create(:user, :admin)
    end

    skip "Does something" do
        log_in_as @user
        visit '/regions/new'
        fill_in 'name', with: 'Fake Region Name'
        click_on 'Add Region'
        expect(page).to have_text('Region successfully created')
    end
end
