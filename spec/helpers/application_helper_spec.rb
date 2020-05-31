require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  it "returns base title if no alternative given" do
    base_title = full_title()
    expect(base_title).to eq 'Disaster Resource Network'
  end

  it "returns both titles if page title given" do
    page_title = "Ice Cream Bois"
    full_title = full_title(page_title)
    expect(full_title).to eq("#{page_title} | Disaster Resource Network")
  end
end
