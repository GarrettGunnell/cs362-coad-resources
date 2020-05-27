FactoryBot.define do
    factory :user do
        role
        email
        password
        trait :admin do
            role { "admin" }
        end

        after :create do |user|
            user.confirm
        end
    end
end