require 'rails_helper'

RSpec.describe 'Releasing a ticket by an', type: :feature do

  before :each do
    @user = create(:user)
    @user.organization = create(:organization, :approved)
    @user.save
    @ticket = create(:ticket, :open)
  end

  it "allows user to capture a released ticket" do
    log_in_as @user
    visit dashboard_path
    click_on 'Tickets'
    click_on(@ticket.name)
    click_on 'Capture'
    click_on 'Tickets'
    click_on(@ticket.name)
    click_on 'Release'
    click_on 'Tickets'
    click_on(@ticket.name)
    expect(page).to have_content('Capture')
  end
end
