FactoryBot.define do
  factory :ticket do
    name
    phone
    id
    region_id {create(:region).id}
    resource_category_id {create(:resourcecategory).id}
    trait :open do
      closed {false}
    end
    trait :closed do
      closed {true}
    end
  end
end