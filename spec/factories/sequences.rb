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

FactoryBot.define do
  sequence :region_id do |n|
    "Region #{n}"
  end
end

FactoryBot.define do
  sequence :resource_category_id do |n|
    "Resource Category #{n}"
  end
end

FactoryBot.define do
  sequence :id do |n|
    "Ticket #{n}"
  end
end

FactoryBot.define do
  sequence :role do |n|
    1
  end
end

FactoryBot.define do
  sequence :email do |n|
    "fake_email@email.com"
  end
end

FactoryBot.define do 
  sequence :password do |n|
    "Fakepassword"
  end
end

FactoryBot.define do 
  sequence :closed do |n|
    false
  end
end