require 'rails_helper'

RSpec.describe Ticket, type: :model do
    it "exists" do
        ticket= Ticket.new
    end
    it {belongs_to(:region)}
    it {belongs_to(:resource_category)}
    it {validates_presense_of(:name)}
end
