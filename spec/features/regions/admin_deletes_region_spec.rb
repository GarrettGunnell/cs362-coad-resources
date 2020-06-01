require 'rails_helper'

RSpec.describe 'Deleting a Region', type: :feature do
  before :each do
    @user = create(:user, :admin)
    @region = create(:region)
  end

  it "does not display region after deletion" do
    log_in_as @user
    click_on 'Region'
    click_on(@region.name)
    click_on 'Delete'
    expect(page).to have_content(@region.name + ' was deleted')
  end
end
