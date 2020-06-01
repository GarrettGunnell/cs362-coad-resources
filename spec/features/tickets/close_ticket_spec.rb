require 'rails_helper'

RSpec.describe 'Closing a ticket', type: :feature do

  before :each do
    @user = create(:user, :admin)
    @ticket = create(:ticket, :open)
  end

  it "displays message confirming deletion" do
    log_in_as @user
    visit dashboard_path
    click_on(@ticket.name)
    click_on 'Close'
    click_on(@ticket.name)
    expect(page).to have_content('Closed')
  end
end
