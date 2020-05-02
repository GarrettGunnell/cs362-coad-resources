FactoryBot.define do
  sequence :name do |n|
    "Fake Name #{n}"
  end
end

FactoryBot.define do
  sequence :phone do |n|
    "111111111#{n}"
  end
end