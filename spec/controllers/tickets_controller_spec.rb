require 'rails_helper'

RSpec.describe TicketsController, type: :controller do

  context 'As a non logged-in user' do
    describe 'GET #new' do
      specify { expect(get(:new)).to be_successful }
    end

    describe 'POST #create' do
      specify { 
        ticket = create(:ticket)
        expect(post(:create, params: { id: ticket.id, ticket: attributes_for(:ticket) })).to be_successful
      }
    end

    describe 'POST #capture' do
      specify { expect(post(:capture, params: {id: 'FAKE'})).to redirect_to dashboard_path }
    end

    describe 'POST #release' do
      specify { expect(post(:release, params: {id: 'FAKE'})).to redirect_to dashboard_path }
    end

    describe 'DELETE #destroy' do
      specify { expect(delete(:destroy, params: {id: 'FAKE'})).to redirect_to dashboard_path }
    end
  end
end
