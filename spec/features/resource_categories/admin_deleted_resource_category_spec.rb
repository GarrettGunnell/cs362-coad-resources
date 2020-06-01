require 'rails_helper'

RSpec.describe 'Deleting a Resource Category', type: :feature do
  before :each do
    @user = create(:user, :admin)
    @resource_category = create(:resourcecategory, :active)
  end

  it "displays category was deleted" do
    log_in_as @user
    visit root_path
    click_on 'Categories'
    click_on(@resource_category.name)
    click_on 'Delete'
    expect(page).to have_content(@resource_category.name + " was deleted")
  end
end
