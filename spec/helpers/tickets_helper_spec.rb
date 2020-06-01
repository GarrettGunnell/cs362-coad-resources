require 'rails_helper'

RSpec.describe TicketsHelper, type: :helper do
  it "correctly formats phone numbers" do
    number = 9712443426
    normalized_number = format_phone_number(number)
    expect(normalized_number).to eq(9712443426)
  end
end
