FactoryBot.define do
  sequence :name do |n|
    "Fake Name #{n}"
  end
end