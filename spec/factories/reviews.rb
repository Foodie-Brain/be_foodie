FactoryBot.define do
  factory :review do
    name { Faker::Food.dish }
    photo { Rack::Test::UploadedFile.new('spec/fixtures/images/test.jpeg') }
    description { Faker::Food.description }
    dairy_free { Faker::Number.between(from: 0, to: 1) }
    gluten_free { Faker::Number.between(from: 0, to: 1) }
    halal { Faker::Number.between(from: 0, to: 1) }
    kosher { Faker::Number.between(from: 0, to: 1) }
    nut_free { Faker::Number.between(from: 0, to: 1) }
    vegan { Faker::Number.between(from: 0, to: 1) }
    vegetarian { Faker::Number.between(from: 0, to: 1) }
    likes { Faker::Number.between(from: 0, to: 1000) }
    dislikes { Faker::Number.between(from: 0, to: 1000) }
    lat { Faker::Address.latitude }
    lng { Faker::Address.longitude }
  end
end
