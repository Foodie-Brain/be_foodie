FactoryBot.define do
  factory :review do
    name { "MyString" }
    photo { "MyString" }
    description { "MyString" }
    dairy_free { 1 }
    gluten_free { 1 }
    halal { 1 }
    kosher { 1 }
    nut_free { 1 }
    vegan { 1 }
    vegitarian { 1 }
    likes { 1 }
    dislikes { 1 }
    lat { "MyString" }
    lon { "MyString" }
  end
end
