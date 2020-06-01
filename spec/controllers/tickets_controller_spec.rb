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

  class FakeTicketService
    def capture_ticket
      :ok
    end

    def release_ticket
      :ok
    end

    def close_ticket
      :ok
    end
  end

  context 'As a logged-in user' do
    let(:user) { create(:user) }
    before(:each) { sign_in(user) }

    describe 'GET #new' do
      specify { expect(get(:new)).to be_successful }
    end

    describe 'POST #create' do
      specify { 
        ticket = create(:ticket)
        expect(post(:create, params: { id: ticket.id, ticket: attributes_for(:ticket) })).to be_successful
      }
    end

    describe 'GET #show' do
      specify { expect(get(:show, params: {id: 'FAKE'})).to redirect_to dashboard_path }
    end

    describe 'POST #capture' do
      it "redirects to dashboard if organization unapproved" do
        ticket = create(:ticket)
        user.organization = create(:organization, :submitted)
        user.save

        expect(post(:capture, params: {id: ticket.id })).to redirect_to dashboard_path
      end

      it "is successful if organization is approved" do
        ticket = create(:ticket)
        user.organization = create(:organization, :approved)
        user.save

        allow(TicketService).to receive(:capture_ticket).and_return FakeTicketService.new

        expect(post(:capture, params: {id: ticket.id })).to be_successful
      end
    end

    describe 'POST #release' do
      it "redirects to dashboard if organization unapproved" do
        ticket = create(:ticket)
        user.organization = create(:organization, :submitted)
        user.save

        expect(post(:release, params: {id: ticket.id })).to redirect_to dashboard_path
      end

      it "is successful if organization is approved" do
        ticket = create(:ticket)
        user.organization = create(:organization, :approved)
        user.save

        allow(TicketService).to receive(:release_ticket).and_return FakeTicketService.new

        expect(post(:release, params: {id: ticket.id })).to be_successful
      end
    end

    describe 'PATCH #close' do
      it "redirects to dashboard if organization unapproved" do
        ticket = create(:ticket)
        user.organization = create(:organization, :submitted)
        user.save

        expect(patch(:close, params: {id: ticket.id })).to redirect_to dashboard_path
      end

      it "is successful if organization is approved" do
        ticket = create(:ticket)
        user.organization = create(:organization, :approved)
        user.save

        allow(TicketService).to receive(:close_ticket).and_return FakeTicketService.new

        expect(patch(:close, params: {id: ticket.id })).to be_successful
      end
    end

    describe 'DELETE #destroy' do
      specify { expect(delete(:destroy, params: {id: 'FAKE'})).to redirect_to dashboard_path }
    end
  end

  context 'as an admin user' do
    let(:user) { create(:user, :admin) }
    before(:each) { sign_in(user) }

    describe 'GET #new' do
      specify { expect(get(:new)).to be_successful }
    end

    describe 'POST #create' do
      specify { 
        ticket = create(:ticket)
        expect(post(:create, params: { id: ticket.id, ticket: attributes_for(:ticket) })).to be_successful
      }
    end

    describe 'GET #show' do
      specify { 
        ticket = create(:ticket)
        expect(get(:show, params: { id: ticket.id })).to be_successful 
      }
    end

    describe 'POST #capture' do
      it "redirects to dashboard if organization unapproved" do
        ticket = create(:ticket)
        user.organization = create(:organization, :submitted)
        user.save

        expect(post(:capture, params: {id: ticket.id })).to redirect_to dashboard_path
      end

      it "is successful if organization is approved" do
        ticket = create(:ticket)
        user.organization = create(:organization, :approved)
        user.save

        allow(TicketService).to receive(:capture_ticket).and_return FakeTicketService.new

        expect(post(:capture, params: {id: ticket.id })).to be_successful
      end
    end

    describe 'POST #release' do
      it "redirects to dashboard if organization unapproved" do
        ticket = create(:ticket)
        user.organization = create(:organization, :submitted)
        user.save

        expect(post(:release, params: {id: ticket.id })).to redirect_to dashboard_path
      end

      it "is successful if organization is approved" do
        ticket = create(:ticket)
        user.organization = create(:organization, :approved)
        user.save

        allow(TicketService).to receive(:release_ticket).and_return FakeTicketService.new

        expect(post(:release, params: {id: ticket.id })).to be_successful
      end
    end

    describe 'PATCH #close' do
      it "is successful if organization is approved" do
        ticket = create(:ticket)
        user.organization = create(:organization, :approved)
        user.save

        allow(TicketService).to receive(:close_ticket).and_return FakeTicketService.new

        expect(patch(:close, params: {id: ticket.id })).to be_successful
      end
    end
  end
end
