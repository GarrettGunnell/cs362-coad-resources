FactoryBot.define do
    factory :resourcecategory do
      name
      trait :unspecified do
        name { 'Unspecified' }
      end
    end
  end