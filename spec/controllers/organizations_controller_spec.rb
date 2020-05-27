require 'rails_helper'

RSpec.describe OrganizationsController, type: :controller do

  context 'As a non logged-in user' do
    describe 'GET #index' do
      specify { expect(get(:index)).to redirect_to(new_user_session_path) }
    end

    describe 'GET #new' do
      specify { expect(get(:new)).to redirect_to(new_user_session_path) }
    end

    describe 'POST #create' do
      specify { expect(post(:create)).to redirect_to(new_user_session_path) }
    end

    describe 'GET #edit' do
      specify { expect(get(:edit, params: {id: 'FAKE'})).to redirect_to(new_user_session_path) }
    end

    describe 'PATCH #update' do
      specify { expect(patch(:update, params: {id: 'FAKE'})).to redirect_to(new_user_session_path) }
    end

    describe 'PUT #update' do
      specify { expect(put(:update, params: {id: 'FAKE'})).to redirect_to(new_user_session_path) }
    end

    describe 'GET #show' do
      specify { expect(get(:show, params: {id: 'FAKE'})).to redirect_to(new_user_session_path) }
    end

    describe 'POST #approve' do
      specify { expect(post(:approve, params: {id: 'FAKE'})).to redirect_to(new_user_session_path) }
    end

    describe 'POST #reject' do
      specify { expect(post(:reject, params: {id: 'FAKE'})).to redirect_to(new_user_session_path) }  
    end
  end
end
