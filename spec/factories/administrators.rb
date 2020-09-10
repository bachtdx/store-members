FactoryBot.define do
  factory :administrator do
    name { Faker::Name.name }
    email 'admin@admin.com'
    password 'admin@123'
  end
end