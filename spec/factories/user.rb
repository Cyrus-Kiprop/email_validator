FactoryBot.define do
  factory :user do
    first_name { Faker::Name.name }
    last_name { Faker::Internet.email }
    url { Faker::Internet.url }
    email { Faker::Internet.email }
  end
end
