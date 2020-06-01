require 'rails_helper'

RSpec.describe 'Logging in', type: :feature do
  before :each do
    @user = create(:user)
  end

  it "displays option for log out after sign in" do
    visit root_path
    click_on 'Log in'
    fill_in 'Email address', with: (@user.email)
    fill_in 'Password', with: (@user.password)
    click_on 'Sign in'
    expect(page).to have_content('Log out')
  end
end
