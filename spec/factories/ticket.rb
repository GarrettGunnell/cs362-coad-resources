FactoryBot.define do
  factory :ticket do
    name
    phone
    id
    region_id
    organization
    resource_category_id
    closed
  end
end