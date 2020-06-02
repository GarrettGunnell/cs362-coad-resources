require 'rails_helper'

RSpec.describe 'Creating a Region', type: :feature do
    before :each do
        @user = create(:user, :admin)
      end
  
      it "displays a success notification" do
        log_in_as @user
        visit new_region_path
        fill_in 'Name', with: 'Fake Region Name'
        click_on 'Add Region'
        expect(page).to have_text('Region successfully created')
      end
end
