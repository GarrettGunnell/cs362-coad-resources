require 'rails_helper'

RSpec.describe ResourceCategory, type: :model do
  let(:resourcecategory) { build(:resourcecategory) }

  describe "Attributes" do
    it { should respond_to(:name) }
    it { should respond_to(:active) }
  end
  
end
