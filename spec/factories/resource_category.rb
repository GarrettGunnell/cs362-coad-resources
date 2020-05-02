FactoryBot.define do
    factory :resourcecategory, class: ResourceCategory do
      name
      trait :unspecified do
        name { 'Unspecified' }
      end
    end
  end