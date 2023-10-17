require "rails_helper"

RSpec.describe Types::QueryType, type: :query do
  describe "Reviews" do
    it 'can return a list of all reviews' do
      reviews_query = <<~GQL
        {
          reviews {
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

      reviews = create_list(:review, 4) 
      result = BeFoodieBrainSchema.execute(reviews_query)

      expect(result["errors"]).to be_nil

      expect(result.dig("data", "reviews")).to match_array(
        reviews.map { |review| { 
          "id" => review.id.to_s, 
          "name" => review.name,
          "description" => review.description,
          "photo" => review.photo,
          "dairyFree" => review.dairy_free,
          "glutenFree" => review.gluten_free,
          "halal" => review.halal,
          "kosher" => review.kosher,
          "nutFree" => review.nut_free,
          "vegan" => review.vegan,
          "vegetarian" => review.vegetarian,
          "likes" => review.likes,
          "dislikes" => review.dislikes,
          "lat" => review.lat,
          "lon" => review.lon
        } }
      )
    end

    it 'can return a specific review' do
      get_review_query = <<~GQL
        query ($review_id: ID!) {
          review(id: $review_id) {
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

      review = create(:review) 
      review_id = review.id
      result = BeFoodieBrainSchema.execute(get_review_query, variables: { review_id: review_id })

      expect(result["errors"]).to be_nil

      expect(result.dig("data", "review")).to eq(
        {
          "id" => review.id.to_s, 
          "name" => review.name,
          "description" => review.description,
          "photo" => review.photo,
          "dairyFree" => review.dairy_free,
          "glutenFree" => review.gluten_free,
          "halal" => review.halal,
          "kosher" => review.kosher,
          "nutFree" => review.nut_free,
          "vegan" => review.vegan,
          "vegetarian" => review.vegetarian,
          "likes" => review.likes,
          "dislikes" => review.dislikes,
          "lat" => review.lat,
          "lon" => review.lon
        }
      )
    end

    it 'returns an error if the review does not exist' do
      get_review_query = <<~GQL
      query ($review_id: ID!) {
        review(id: $review_id) {
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


      review = create(:review) 
      review_id = review.id
      result = BeFoodieBrainSchema.execute(get_review_query, variables: { review_id: 555 })

      expect(result["errors"]).to_not be_nil
      expect(result.dig("data", "review")).to be_nil
      expect(result["errors"][0]["message"]).to eq("Review not found with id: 555")
    end
  end
end