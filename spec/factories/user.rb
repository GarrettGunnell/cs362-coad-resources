FactoryBot.define do
    factory :user do
        role { "organization" }
        email
        password { "fakepassword" }
        trait :admin do
            role { "admin" }
        end

        after :create do |user|
            user.confirm
        end
    end
end