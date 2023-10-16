# Foodie Brain :bento: :brain:

*An application developed with Ruby on Rails*

An application that allows users to mark and share their favorite food spots and dishes on a map. Users will be able to see the locations mark and decide if they want to try it. It is a fast and easy way to enjoy and find new food trends and expand your taste buds. Foodie brain connects users as one, food lover application

Some quick points of Foodie Brain
- Mark and explore food spots and dishes on an interactive map.
- Share photos and reviews with fellow food enthusiasts.

## Authors

### BE Team
- Gabe Torres [GitHub](https://github.com/Gabe-Torres) | [LinkedIn](https://www.linkedin.com/in/gabe-torres-74a515269/)
- Weston Schutt [GitHub](https://github.com/westonio) | [LinkedIn](https://www.linkedin.com/in/westonschutt/)
- Chris Asercion [GitHub](https://github.com/ChrisAsercion) | [LinkedIn](https://www.linkedin.com/in/chris-asercion-2a7b68135/)
- Zanna Fitch [GitHub](https://github.com/z-fitch) | [LinkedIn](https://www.linkedin.com/in/zannafitch/)

### FE Team

## Summary 
- [Getting Started](#getting-started)
- [Endpoints](#endpoints)
- [Test Suite](#test-suite)
- [Graphql JSON Contract](#graphql-json-contract)
- [Reflection](#reflection)
- [Developed With](#developed-with)
- [FRONTEND REPO LINK](https://github.com/Foodie-Brain/fe_foodie)

## Getting Started

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

## Graphql JSON Contract
*Description of API endpoints for front end application*

<u> All Reviews </u>
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

<u> Individual Review </u>
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
<u> Create a Review </u>
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
# Routes

| Action | Route |
| ----------- | ----------- |
| post | '/graphql' |

# Test Suite
 - run `bundle exec rspec` to run the test suite

**HappyPath**
```ruby
happy
```

**SadPath**
```ruby
sad
```

## Reflection 
During the development of our Ruby on Rails application Foodie Brain, we had the opportunity to work on an exciting and challenging project that combined aspects of web development, including API integration, database design, graphql, and frontend development/backend collaboration. This reflection highlights key aspects of our work and the lessons learned during the development of Foodie Brain.

<u> API Integration: </u>

<u>Creating Endpoints: </u>

<u>Frontend Development: </u>

<u>Database Design: </u>

<u>Graphql: </u>

<u>Lessons Learned: </u>

*Throughout this project, We learned several valuable lessons:*


In conclusion, working on this Ruby on Rails application was a challenging yet awarding experience. It brought together various aspects of web development, challenging us to create a dynamic application. The project allowed us to expand our knowledge and skills in API integration, database design, frontend development, and introduced a new tech in graphql. And it provided valuable lessons that will guide us in future endeavors.

# Frontend Repo Link
[Frontend Repo](https://github.com/Foodie-Brain/fe_foodie)

---
# Developed With
---


<img src="https://user-images.githubusercontent.com/127896538/267407283-0389dace-15c6-493c-a3b7-3a833f0a20f2.png" width="50" alt="Rails Logo"><img src="https://raw.githubusercontent.com/devicons/devicon/55609aa5bd817ff167afce0d965585c92040787a/icons/heroku/heroku-original-wordmark.svg" width="50" alt="heroku Logo"><img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/github/github-original-wordmark.svg" width="50" alt="github Logo"><img src="https://user-images.githubusercontent.com/127896538/267406979-5e0db686-91a1-42ee-9bda-675a5c5c2266.png" width="50" alt="Ruby Logo"><img  src='https://raw.githubusercontent.com/devicons/devicon/master/icons/postgresql/postgresql-original-wordmark.svg' width='50' alt='sql'><img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/circleci/circleci-plain-wordmark.svg" width="50" alt="Circle CI"><img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/graphql/graphql-plain-wordmark.svg" width="50" alt="graphql">