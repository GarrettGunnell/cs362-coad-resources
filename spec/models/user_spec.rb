require 'rails_helper'

RSpec.describe User, type: :model do
    it "exists" do
        user = User.new
    end
    #it {validates_presence_of(:email)}
end
