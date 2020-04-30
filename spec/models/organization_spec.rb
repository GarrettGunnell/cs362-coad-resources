require 'rails_helper'

RSpec.describe Organization, type: :model do
  let(:organization) { Organization.new }

  describe "Attributes" do
    it {should respond_to(:name) }
  end
end
