require 'rails_helper'

RSpec.describe Ticket, type: :model do
  let(:ticket) {build(:ticket)}

  describe "Attributes" do
    it { should respond_to(:name)}
    it { should respond_to(:phone)}
    it { should respond_to(:region_id)}
    it { should respond_to(:resource_category_id)}
  end

  describe "Relationships" do
    it {should belong_to(:region)}
    it {should belong_to(:resource_category)}
    it {should belong_to(:organization).optional}
  end

#   describe "Validations" do
      
#   end

end
