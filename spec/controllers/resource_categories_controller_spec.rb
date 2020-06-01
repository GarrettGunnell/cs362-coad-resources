require 'rails_helper'

RSpec.describe ResourceCategoriesController, type: :controller do

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

    describe 'PATCH #activate' do
      specify { expect(patch(:activate, params: {id: 'FAKE'})).to redirect_to new_user_session_path }
    end

    describe 'PATCH #deactivate' do
      specify { expect(patch(:deactivate, params: {id: 'FAKE'})).to redirect_to new_user_session_path }  
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

    describe 'PATCH #activate' do
      specify { expect(patch(:activate, params: {id: 'FAKE'})).to redirect_to dashboard_path }
    end

    describe 'PATCH #deactivate' do
      specify { expect(patch(:deactivate, params: {id: 'FAKE'})).to redirect_to dashboard_path }  
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
    specify { expect(post(:create, params: { resource_category: attributes_for(:resourcecategory) })).to redirect_to resource_categories_path }
    end

    describe 'GET #edit' do
      specify { 
        resource_category = create(:resourcecategory)
        expect(get(:edit, params: {id: resource_category.id})).to be_successful
      }
    end

    describe 'PATCH #update' do
      specify { 
        resource_category = create(:resourcecategory)
        expect(patch(:update, params: {id: resource_category.id, resource_category: attributes_for(:resourcecategory) })).to redirect_to resource_category
      }
    end

    describe 'GET #show' do
      specify { 
        resource_category = create(:resourcecategory)
        expect(get(:show, params: {id: resource_category.id})).to be_successful
       }
    end

    describe 'PATCH #activate' do
      specify { 
        resource_category = create(:resourcecategory, :inactive)
        expect(patch(:activate, params: {id: resource_category.id})).to redirect_to resource_category
       }
    end

    describe 'PATCH #deactivate' do
      specify { 
        resource_category = create(:resourcecategory, :active)
        expect(patch(:deactivate, params: { id: resource_category.id })).to redirect_to resource_category
      }  
    end
  end
end
