FactoryBot.define do
    factory :resourcecategory, class: ResourceCategory do
      name
      trait :unspecified do
        name { 'Unspecified' }
      end
      trait :active do
        active { true }
      end
      trait :inactive do
        active { false }
      end
    end
  end