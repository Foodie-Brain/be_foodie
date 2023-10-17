# Foodie Brain :bento: :brain:

An application that allows users to mark and share their favorite food spots and dishes on a map. Users will be able to see the locations mark and decide if they want to try it. It is a fast and easy way to enjoy and find new food trends and expand your taste buds. Foodie brain connects users as one, food lover application

Some quick points of Foodie Brain
- Mark and explore food spots and dishes on an interactive map.
- Share photos and reviews with fellow food enthusiasts.
- Vote on your favorite dishes and spots.
<details>
<summary>Authors</summary>

### BE Team
- Gabe Torres [GitHub](https://github.com/Gabe-Torres) | [LinkedIn](https://www.linkedin.com/in/gabe-torres-74a515269/)
- Weston Schutt [GitHub](https://github.com/westonio) | [LinkedIn](https://www.linkedin.com/in/westonschutt/)
- Chris Asercion [GitHub](https://github.com/ChrisAsercion) | [LinkedIn](https://www.linkedin.com/in/chris-asercion-2a7b68135/)
- Zanna Fitch [GitHub](https://github.com/z-fitch) | [LinkedIn](https://www.linkedin.com/in/zannafitch/)

### FE Team
- Paulina Rubio [GitHub](https://github.com/paulina-isabel) | [LinkedIn](https://www.linkedin.com/in/paulina-isabel-rubio/)
- Lauren DeLaRosa [GitHub](https://github.com/LDeLaRosa13) | [LinkedIn](https://www.linkedin.com/in/lauren-delarosa-3a5a4b260/)
</details>

## Summary 
- [Getting Started](#getting-started)
- [Graphql JSON Contract](#graphql-json-contract)
- [Routes](#routes)
- [Test Suite](#test-suite)
- [Reflection](#reflection)
- [Important Links](#important-links)
- [Developed With](#developed-with)

## Getting Started
<details>
<summary>Database Information</summary>

**Schema**

```ruby
ActiveRecord::Schema[7.0].define(version: 2023_10_12_212027) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "reviews", force: :cascade do |t|
    t.string "name"
    t.string "photo"
    t.string "description"
    t.integer "dairy_free", default: 0
    t.integer "gluten_free", default: 0
    t.integer "halal", default: 0
    t.integer "kosher", default: 0
    t.integer "nut_free", default: 0
    t.integer "vegan", default: 0
    t.integer "vegetarian", default: 0
    t.integer "likes", default: 0
    t.integer "dislikes", default: 0
    t.string "lat"
    t.string "lon"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
```

**Gems**
```ruby
gem "rails", "~> 7.0.8"
gem "pg", "~> 1.1"
gem "puma", "~> 5.0"
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
gem "bootsnap", require: false

gem 'graphql'
gem 'faraday'

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem 'factory_bot_rails'
  gem 'faker'
  gem "pry"
  gem "rspec-rails"
  gem 'simplecov'
  gem 'shoulda-matchers', '~> 5.0'
end

group :development do
  gem 'graphiql-rails'
end
```

 **Installing**
 - Fork and clone this repo
  - Run `bundle install`
  - Run `rails db:{create,migrate,seed}`
  - Run `rails s` to start the server
  - Open your browser and navigate to `localhost:3000`
</details>

## Graphql JSON Contract
*Description of API endpoints for front end application*

<details>
<summary>All Reviews</summary>

- Description of all reviews

> `POST /graphql`

*Request Body:*

```ruby
	{
      reviews {
        id
        name
        description
        glutenFree
        lat
        lon
        }
		}
```

*Success Response (200 OK):*

- Status: 200 OK
- Description: Successful response with all Reviews.
- Data Format: A hash of review objects, each containing an id, name, description, lat/lon and dietary tag.

*Return*
```ruby
{
    "data": {
        "reviews": [
            {
                "id": "1",
                "name": "Flu Shot Pho",
                "description": "Pho with lemongrass, lime, and chili broth",
                "glutenFree": 0,
                "lat": "39.6880903110667",
                "lon": "-104.94002900531989"
            },
            {
                "id": "2",
                "name": "ramen",
                "description": "noddles",
                "glutenFree": 0,
                "lat": "0999",
                "lon": "-999"
            },
            {
                "id": "3",
                "name": "ramen",
                "description": "noddles",
                "glutenFree": 0,
                "lat": "0999",
                "lon": "-999"
            },
            {
                "id": "4",
                "name": "SUCUK TOST",
                "description": "Grilled sourdough bread filled with Sucuk (Turkish sausage) and mozzarella cheese.",
                "glutenFree": 0,
                "lat": "39.7014138",
                "lon": "-104.911551"
            },
            {
                "id": "5",
                "name": "SUCUK TOST",
                "description": "Grilled sourdough bread filled with Sucuk (Turkish sausage) and mozzarella cheese.",
                "glutenFree": 0,
                "lat": "39.7014138",
                "lon": "-104.911551"
            }
        ]
    }
}
```
---
*Error Response (400):*

- Status: 400 Bad Request
- Description: An error response indicating that the request was invalid.
- Data Format: A hash of that contains the key "errors" and a message describing the error in detail.

*Request Body:*

```ruby
	{
      reviews {
        id
        name
        price
        glutenFree
        lat
        lon
        }
		}
```

*Return*
```ruby
{
    "errors": [
        {
            "message": "Field 'price' doesn't exist on type 'Review'",
            "locations": [
                {
                    "line": 5,
                    "column": 9
                }
            ],
            "path": [
                "query",
                "reviews",
                "price"
            ],
            "extensions": {
                "code": "undefinedField",
                "typeName": "Review",
                "fieldName": "price"
            }
        }
    ]
}
```
</details>


<details>
<summary>Individual Review</summary>

- Description of an individual review

> `POST /graphql`

*Request Body:*

```ruby
 {
      review(id: 1) {
          id
          name
          description
          glutenFree
          lat
        	lon
      }
    }
```

*Success Response (200 OK):*

- Status: 200 OK
- Description: Successful response with a Review.
- Data Format: A hash containing a review object, containing an id, name, description, lat/lon and dietary tag.

*Return*
```ruby
{
    "data": {
        "review": {
            "id": "1",
            "name": "Flu Shot Pho",
            "description": "Pho with lemongrass, lime, and chili broth",
            "glutenFree": 0,
            "lat": "39.6880903110667",
            "lon": "-104.94002900531989"
        }
    }
}
```
---
*Error Response (400):*

- Status: 400 Bad Request
- Description: An error response indicating that the request was invalid as no Review matches the requested ID.
- Data Format: A hash of that contains the key "errors" and a message describing the error in detail.

*Request Body:*

```ruby
	{
      reviews(id: 999) {
        id
        name
        price
        glutenFree
        lat
        lon
        }
		}
```

*Return*
```ruby 
{
  "data": null,
  "errors": [
    {
      "message": "Review not found with id: 999",
      "locations": [
        {
          "line": 2,
          "column": 7
        }
      ],
      "path": [
        "review"
      ]
    }
  ]
}
```
</details>

<details>
<summary>Create a Review</summary>

- Description of creating a review

> `POST /graphql`

*Request Body:*

```ruby
 mutation {
      createReview(input: {
        name: "FireCracker Sushi", 
        photo: "nada.jpg", 
        description: "Fried sushi roll with salmon, creamcheese, and jalapenos",
        dairyFree: 1, 
        glutenFree: 1, 
        halal: 1, 
        kosher: 1, 
        nutFree: 1, 
        vegan: 1, 
        vegitarian: 1, 
        likes: 312, 
        dislikes: 5, 
        lat: "39.72903251256764", 
        lon: "-104.93865153415369"
      }) {
        	id
          name
          description
          glutenFree
          lat
        	lon
      }
    } 
```

*Success Response (200 OK):*

- Status: 200 OK
- Description: Successful response for creating a Review.
- Data Format: A hash containing a review object, containing an id, name, description, lat/lon and dietary tag.

*Return*
```ruby
{
    "data": {
        "createReview": {
            "id": "6",
            "name": "FireCracker Sushi",
            "description": "Fried sushi roll with salmon, creamcheese, and jalapenos",
            "glutenFree": 1,
            "lat": "39.72903251256764",
            "lon": "-104.93865153415369"
        }
    }
}
```
---
*Error Response (400):*

- Status: 400 Bad Request
- Description: An error response indicating that the request was invalid as all required fields need input.
- Data Format: A hash of that contains the key "errors" and a message describing the error in detail.

*Request Body:*

```ruby
	mutation {
      createReview(input: {
        name: "", 
        photo: "nada.jpg", 
        description: "",
        dairyFree: 1, 
        glutenFree: 1, 
        halal: 1, 
        kosher: 1, 
        nutFree: 1, 
        vegan: 1, 
        vegetarian: 1, 
        likes: 312, 
        dislikes: 5, 
        lat: "39.72903251256764", 
        lon: "-104.93865153415369"
      }) {
        	id
          name
          description
          glutenFree
          lat
        	lon
      }
    } 
```

*Response* 
```ruby
{
    "data": {
        "createReview": null
    },
    "errors": [
        {
            "message": "Name can't be blank, Description can't be blank",
            "locations": [
                {
                    "line": 2,
                    "column": 7
                }
            ],
            "path": [
                "createReview"
            ]
        }
    ]
}
```
</details>

## Routes

| Action | Route |
| ----------- | ----------- |
| post | '/graphql' |


## Test Suite
 - run `bundle exec rspec` to run the test suite

<details>
<summary>Happy Path</summary>

```ruby
RSpec.describe Mutations::CreateReview, type: :mutation do
  describe 'createReview' do
    let(:name) { "Cinnamon Coffee Cake" }
    let(:description) { "Found this absolutely delicious coffee cake at Kochi coffee, and it's gluten-free!" }
    let(:photo) { "fake_url.png" }
    let(:gluten_free) { 1 }
    let(:lat) { "39.72740886344144" }
    let(:lon) { "-104.93939410569635" }

      let(:mutation) do
        <<~GQL
          mutation createReview($input: CreateReviewInput!) {
            createReview(input: $input) {
              id
              name
              description
              photo
              dairyFree
              glutenFree
              halal
              kosher
              nutFree
              vegan
              vegetarian
              likes
              dislikes
              lat
              lon
            }
          }
        GQL
      end

    it 'creates a new review' do
      input = {
        name: name,
        description: description,
        photo: photo,
        glutenFree: gluten_free,
        lat: lat,
        lon: lon
      }

      result = BeFoodieBrainSchema.execute(
        mutation,
        variables: { input: input }
      )

      expect(result["errors"]).to be_nil

      review = Review.last

      expect(result.dig("data", "createReview", "id")).to eq(review.id.to_s)
      expect(result.dig("data", "createReview", "name")).to eq(name)
      expect(result.dig("data", "createReview", "description")).to eq(description)
      expect(result.dig("data", "createReview", "photo")).to eq(photo)
      expect(result.dig("data", "createReview", "glutenFree")).to eq(gluten_free)
      expect(result.dig("data", "createReview", "lat")).to eq(lat)
      expect(result.dig("data", "createReview", "lon")).to eq(lon)

      expect(result.dig("data", "createReview", "dairyFree")).to eq(0)
      expect(result.dig("data", "createReview", "halal")).to eq(0)
      expect(result.dig("data", "createReview", "kosher")).to eq(0)
      expect(result.dig("data", "createReview", "nutFree")).to eq(0)
      expect(result.dig("data", "createReview", "vegan")).to eq(0)
      expect(result.dig("data", "createReview", "vegetarian")).to eq(0)
      expect(result.dig("data", "createReview", "likes")).to eq(0)
      expect(result.dig("data", "createReview", "dislikes")).to eq(0)
```
</details>

<details>
<summary>Sad Path</summary>

```ruby
describe 'returns an error when no input is provided' do
    let(:name) { "Cinnamon Coffee Cake" }
    let(:description) { "Found this absolutely delicious coffee cake at Kochi coffee, and it's gluten-free!" }
    let(:photo) { "fake_url.png" }
    let(:gluten_free) { 1 }
    let(:lat) { "39.72740886344144" }
    let(:lon) { "-104.93939410569635" }

      let(:mutation) do
        <<~GQL
          mutation createReview($input: CreateReviewInput!) {
            createReview(input: $input) {
              id
              name
              description
              photo
              dairyFree
              glutenFree
              halal
              kosher
              nutFree
              vegan
              vegetarian
              likes
              dislikes
              lat
              lon
            }
          }
        GQL
      end

    it 'returns an error when required fields not provided' do
      input = {
        name:'',
        description: description,
        photo: photo,
        glutenFree: gluten_free,
        lat: lat,
        lon: lon
      }

      result = BeFoodieBrainSchema.execute(
        mutation,
        variables: { input: input }
      )

      expect(result["errors"]).to_not be_nil
      expect(result.dig("data", "createReview")).to be_nil
      expect(result["errors"][0]["message"]).to eq("Name can't be blank")

      input2 = {
        name: '',
        description: '',
        photo: photo,
        glutenFree: gluten_free,
        lat: lat,
        lon: lon
      }

      result2 = BeFoodieBrainSchema.execute(
        mutation,
        variables: { input: input2 }
      )

      expect(result2["errors"][0]["message"]).to eq("Name can't be blank, Description can't be blank")
    end
  end
end
```
</details>

## Reflection 
<details>
<summary>Our reflection of building Foodie Brain</summary>
During the development of our Ruby on Rails application Foodie Brain, we had the opportunity to work on an exciting and challenging project that combined aspects of web development, including API integration, database design, graphql, and frontend development/backend collaboration. This reflection highlights key aspects of our work and the lessons learned during the development of Foodie Brain.

<u> API Integration: </u>

<u>Creating Endpoints: </u>

<u>Frontend Development: </u>

<u>Database Design: </u>

<u>Graphql: </u>

<u>Lessons Learned: </u>

*Throughout this project, We learned several valuable lessons:*


In conclusion, working on this Ruby on Rails application was a challenging yet awarding experience. It brought together various aspects of web development, challenging us to create a dynamic application. The project allowed us to expand our knowledge and skills in API integration, database design, frontend development, and introduced a new tech in graphql. And it provided valuable lessons that will guide us in future endeavors.
</details>

## Important Links
- [Frontend Repo](https://github.com/Foodie-Brain/fe_foodie)
- [BE production site](https://be-foodie-brain-b49c609f52cc.herokuapp.com/)
- [FE production site](https://foodie-brain-4c71bb461e4b.herokuapp.com/)

---
## Developed With

<img src="https://user-images.githubusercontent.com/127896538/267407283-0389dace-15c6-493c-a3b7-3a833f0a20f2.png" width="50" alt="Rails Logo"><img src="https://raw.githubusercontent.com/devicons/devicon/55609aa5bd817ff167afce0d965585c92040787a/icons/heroku/heroku-original-wordmark.svg" width="50" alt="heroku Logo"><img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/github/github-original-wordmark.svg" width="50" alt="github Logo"><img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/ruby/ruby-plain-wordmark.svg" width="50" alt="Ruby Logo"><img  src='https://raw.githubusercontent.com/devicons/devicon/master/icons/postgresql/postgresql-original-wordmark.svg' width='50' alt='sql'><img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/circleci/circleci-plain-wordmark.svg" width="50" alt="Circle CI"><img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/graphql/graphql-plain-wordmark.svg" width="50" alt="graphql"><img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/rspec/rspec-original-wordmark.svg" width="70" alt="rspec"><img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/git/git-plain-wordmark.svg" width="50" alt="git">