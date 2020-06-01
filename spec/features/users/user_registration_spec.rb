require 'rails_helper'

RSpec.describe 'User registration', type: :feature do

  it "displays message with email confirmation" do
    visit root_path
    click_on 'Sign up'
    fill_in 'Email address', with: "Testemail@test.com"
    fill_in 'Password', with: "password"
    fill_in 'Password confirmation', with: "password"
    click_on 'commit'
    expect(page).to have_content("A message with a confirmation link has been sent to your email address.")
  end
end
