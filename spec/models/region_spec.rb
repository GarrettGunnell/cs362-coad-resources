require 'rails_helper'

RSpec.describe Region, type: :model do
  let(:region) { build(:region) }

  describe "Attributes" do
    it { should respond_to(:name) }
  end

  describe "Relationships" do
    it { should have_many(:tickets) }
  end
end
