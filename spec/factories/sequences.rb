FactoryBot.define do
  sequence :name do |n|
    "Fake Name #{n}"
  end
end

FactoryBot.define do
  sequence :phone do |n|
    "+61 412 345 678"
  end
end

FactoryBot.define do
  sequence :region_id do |n|
    "Region test"
  end
end

FactoryBot.define do
  sequence :resource_category_id do |n|
    "Resource Category test"
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
    "fake_email#{n}@email.com"
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