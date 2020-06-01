require 'rails_helper'

RSpec.describe RegionsController, type: :controller do
  
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

    describe 'POST #destroy' do
      specify { expect(post(:destroy, params: {id: 'FAKE'})).to redirect_to new_user_session_path }
    end
  end

  context 'As a logged-in user' do
    let(:user) { create(:user) }
    before(:each) { sign_in(user) }

    describe 'GET #index' do
      specify { expect(get(:index)).to redirect_to dashboard_path }
    end

    describe 'GET #new' do
      specify { expect(get(:new)).to redirect_to dashboard_path }
    end

    describe 'POST #create' do
      specify { expect(post(:create)).to redirect_to dashboard_path }
    end

    describe 'GET #edit' do
      specify { expect(get(:edit, params: {id: 'FAKE'})).to redirect_to dashboard_path }
    end

    describe 'PATCH #update' do
      specify { expect(patch(:update, params: {id: 'FAKE'})).to redirect_to dashboard_path }
    end

    describe 'GET #show' do
      specify { expect(get(:show, params: {id: 'FAKE'})).to redirect_to dashboard_path }
    end

    describe 'POST #destroy' do
      specify { expect(post(:destroy, params: {id: 'FAKE'})).to redirect_to dashboard_path }
    end
  end

  context 'As an admin user' do
    let(:user) { create(:user, :admin) }
    before(:each) { sign_in(user) }

    describe 'GET #index' do
      specify { expect(get(:index)).to be_successful }
    end

    describe 'GET #new' do
      specify { expect(get(:new)).to be_successful }
    end

    describe 'POST #create' do
      specify { expect(post(:create, params: { region: attributes_for(:region) })).to redirect_to regions_path }
    end

    describe 'GET #edit' do
      specify { 
        region = create(:region)
        expect(get(:edit, params: {id: region.id})).to be_successful
      }
    end

    describe 'PATCH #update' do
      specify { 
        region = create(:region)
        expect(patch(:update, params: {id: region.id, region: attributes_for(:region)})).to redirect_to regions_path + "/" + region.id.to_s
      } 
      end

    describe 'GET #show' do
      specify {
        region = create(:region) 
        expect(get(:show, params: {id: region.id})).to be_successful 
      }
    end

    describe 'POST #destroy' do
      specify { 
        region = create(:region)
        expect(post(:destroy, params: {id: region.id})).to redirect_to regions_path
       }
    end
  end
end
