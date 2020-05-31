require 'rails_helper'

RSpec.describe TicketsHelper, type: :helper do
  it "correctly formats phone numbers" do
    number = 9712443426
    normalized_number = format_phone_number(number)
    puts normalized_number
  end
end
