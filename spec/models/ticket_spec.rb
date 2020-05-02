require 'rails_helper'

RSpec.describe Ticket, type: :model do
  let(:ticket) { build(:ticket) }

  describe "Attributes" do
    it { should respond_to(:name) }
    it { should respond_to(:description) }
    it { should respond_to(:phone) }
    it { should respond_to(:organization_id) }
    it { should respond_to(:closed) }
    it { should respond_to(:closed_at) }
    it { should respond_to(:resource_category_id) }
    it { should respond_to(:region_id) }
  end

  describe "Relationships" do
    it { should belong_to(:region) }
    it { should belong_to(:resource_category) }
    it { should belong_to(:organization) }
  end

  describe "Validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:phone) }
    it { should validate_presence_of(:region_id) }
    it { should validate_presence_of(:resource_category_id) }

    it { should validate_length_of(:name).is_at_least(1).is_at_most(255) }
    it { should validate_length_of(:description).is_at_most(1020) }
    it { should validate_length_of(:phone), "10" }
  end

#   describe "#open"
#     it "distinguishes between open and closed tickets"
#       closed_ticket = Ticket.create(closed: true)
#       open_ticket = Ticket.create(closed: false)

#       open_tickets = Ticket.open
#       expect(open_tickets).to include(open_ticket)
#     end
#   end

#   describe "open? method" do
#   end
#   describe "captured? method" do
#   end
#   describe "to_s" do
#   end

end
