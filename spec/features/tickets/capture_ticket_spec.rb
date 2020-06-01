require 'rails_helper'

RSpec.describe 'Capturing a ticket', type: :feature do

  before :each do
      @user = create(:user, :admin)
      @organization = create(:organization, :submitted)
  end

  it "displays " do
  end
end