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