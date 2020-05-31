require 'rails_helper'

RSpec.describe DashboardController, type: :controller do

  context "as a non logged-in user" do
    describe 'GET #index' do
      specify { expect(get(:index)).to redirect_to new_user_session_path }
    end
  end

  context "as a logged-in user" do
    let(:user) { create(:user) }
    before(:each) { sign_in(user) }

    describe 'GET #index' do
      specify { expect(get(:index)).to be_successful }
    end
  end

  context "as an admin user" do
    let(:user) { create(:user, :admin) }
    before(:each) { sign_in(user) }

    describe 'GET #index' do
      specify { expect(get(:index)).to be_successful }
    end
  end
end
