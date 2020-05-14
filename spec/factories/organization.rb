FactoryBot.define do
  factory :organization do
    name
    primary_name {"fakename"}
    email
    phone
    secondary_name {"fakename2"}
    secondary_phone {"+61 412 345 672"}
  end
end