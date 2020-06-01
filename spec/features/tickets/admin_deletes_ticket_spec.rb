require 'rails_helper'

RSpec.describe 'Deleting a Ticket', type: :feature do

  before :each do
    @user = create(:user, :admin)
    @ticket = create(:ticket)
  end

  it "removes deleted tickets from list" do
    log_in_as @user
    visit dashboard_path
    click_on(@ticket.name)
    click_on 'Delete'
    expect(page).to_not have_content(@ticket.name)
  end
end
