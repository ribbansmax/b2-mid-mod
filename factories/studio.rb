FactoryBot.define do
  factory :studio do
    name { Faker::Company.name }
    location { Faker::Address.street_address}
  end

  factory :actor do
    name { Faker::Name.name}
    age { Faker::Number.between(from: 20, to: 80)}
  end
end