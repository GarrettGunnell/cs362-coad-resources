require 'rails_helper'

RSpec.describe 'Creating an Organization Application', type: :feature do

  before :each do
    @user = create(:user)
  end

  it "displays an application submitted message" do
    create(:user, :admin)
    log_in_as @user
    visit new_organization_application_path
    choose 'organization_liability_insurance_true'
	  choose 'organization_agreement_one_true'
	  choose 'organization_agreement_two_true'
	  choose 'organization_agreement_three_true'
	  choose 'organization_agreement_four_true'
	  choose 'organization_agreement_five_true'
	  choose 'organization_agreement_six_true'
	  choose 'organization_agreement_seven_true'
    choose 'organization_agreement_eight_true'
    fill_in 'organization_primary_name', with: 'FAKE'
	  fill_in 'organization_name', with: 'FAKE'
	  fill_in 'organization_title', with: 'FAKE'
	  fill_in 'organization_phone', with: '123 456 7891'
	  fill_in 'organization_secondary_name', with: 'FAKE'
	  fill_in 'organization_secondary_phone', with: '123 456 7890'
	  fill_in 'organization_email', with: 'FAKE@domain.com'
	  fill_in 'organization_description', with: 'FAKE'
    click_on "Apply"
    expect(page).to have_content("Application Submitted")
  end
end
