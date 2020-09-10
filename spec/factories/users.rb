FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email 'abc@abc.com'
    password 'abc'
  end
end