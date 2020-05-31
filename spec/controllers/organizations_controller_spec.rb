require 'rails_helper'

RSpec.describe OrganizationsController, type: :controller do

  context 'As a non logged-in user' do
    describe 'GET #index' do
      specify { expect(get(:index)).to redirect_to new_user_session_path }
    end

    describe 'GET #new' do
      specify { expect(get(:new)).to redirect_to new_user_session_path }
    end

    describe 'POST #create' do
      specify { expect(post(:create)).to redirect_to new_user_session_path }
    end

    describe 'GET #edit' do
      specify { expect(get(:edit, params: {id: 'FAKE'})).to redirect_to new_user_session_path }
    end

    describe 'PATCH #update' do
      specify { expect(patch(:update, params: {id: 'FAKE'})).to redirect_to new_user_session_path }
    end

    describe 'PUT #update' do
      specify { expect(put(:update, params: {id: 'FAKE'})).to redirect_to new_user_session_path }
    end

    describe 'GET #show' do
      specify { expect(get(:show, params: {id: 'FAKE'})).to redirect_to new_user_session_path }
    end

    describe 'POST #approve' do
      specify { expect(post(:approve, params: {id: 'FAKE'})).to redirect_to new_user_session_path }
    end

    describe 'POST #reject' do
      specify { expect(post(:reject, params: {id: 'FAKE'})).to redirect_to new_user_session_path }  
    end
  end

  class FakeMailer
    def new_organization_application
      false
    end
  end

  context 'As a logged-in user' do
    let(:user) { create(:user) }
    before(:each) { sign_in(user) }

    describe 'GET #index' do
      specify { expect(get(:index)).to be_successful }
    end

    describe 'GET #new' do
      specify { expect(get(:new)).to be_successful }
    end

    describe 'POST #create' do
      specify { expect(post(:create, params: { organization: { name: 'FAKE' } })).to be_successful }

      it "redirects to submitted path after sucessful creation" do
        allow(UserMailer).to receive(:with).and_return FakeMailer.new

        expect(post(:create, params: { organization: attributes_for(:organization) })).to redirect_to(organization_application_submitted_path)
      end
    end

    describe 'GET #edit' do
      specify { 
        user.organization = create(:organization, :approved)
        user.save
        expect(get(:edit, params: {id: user.organization.id })).to be_successful 
      }
    end

    describe 'PATCH #update' do
      specify { expect(get(:update, params: {id: 'FAKE' })).to redirect_to dashboard_path } 
    end

    describe 'GET #show' do
      specify { expect(get(:show, params: {id: 'FAKE' })).to redirect_to dashboard_path }
    end

    describe 'POST #approve' do
      specify { expect(post(:approve, params: {id: 'FAKE'})).to redirect_to dashboard_path }
    end

    describe 'POST #reject' do
      specify { expect(post(:reject, params: {id: 'FAKE'})).to redirect_to dashboard_path }  
    end
  end
end
