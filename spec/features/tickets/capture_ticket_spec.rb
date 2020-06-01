require 'rails_helper'

RSpec.describe 'Capturing a ticket', type: :feature do

  before :each do
      @user = create(:user)
      @user.organization = create(:organization, :approved)
      @user.save
      @ticket = create(:ticket)
  end

  it "displays ticket in organization dashboard after capture" do
    log_in_as @user
    visit dashboard_path
    click_on 'Tickets'
    click_on(@ticket.name)
    click_on 'Capture'
    click_on 'Tickets'
    click_on(@ticket.name)
    expect(page).to have_content('Release')
  end
end