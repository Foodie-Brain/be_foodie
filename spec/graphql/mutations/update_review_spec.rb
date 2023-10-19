require 'rails_helper'

RSpec.describe Mutations::UpdateReview, type: :mutation do
  describe 'updateReview' do
    before :each do
      @review = Review.create!(name: "Matcha Mochi Donut", photo: "example.png", description: "Donuts made with Mochi", dairy_free: 0, gluten_free: 0, halal: 0, kosher: 0, nut_free: 0, vegan: 0, vegetarian: 0, likes: 23, dislikes: 1, lat: "39.675827212143645", lng: "-104.8654249015717") 
    end 
      let(:mutation) do
        <<~GQL
          mutation updateReview($input: UpdateReviewInput!) {
            updateReview(input: $input) {
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
              lng
            }
          }
        GQL
      end

    it 'updates the review' do
      input = {
        id: @review.id,
        name: "sushi",
        description: "Very good",
      }

      result = BeFoodieBrainSchema.execute(
        mutation,
        variables: { input: input }
      )

      expect(result.dig("data", "updateReview", "id")).to eq(@review.id.to_s)
      expect(result.dig("data", "updateReview", "name")).to eq("sushi")
      expect(result.dig("data", "updateReview", "description")).to eq("Very good")
      
      expect(result.dig("data", "updateReview", "name")).to_not eq("Matcha Mochi Donut")
      expect(result.dig("data", "updateReview", "description")).to_not eq("Donuts made with Mochi")

      expect(result.dig("data", "updateReview", "photo")).to eq("example.png")
      expect(result.dig("data", "updateReview", "lat")).to eq("39.675827212143645")
      expect(result.dig("data", "updateReview", "lng")).to eq("-104.8654249015717")
      expect(result.dig("data", "updateReview", "glutenFree")).to eq(0)
      expect(result.dig("data", "updateReview", "dairyFree")).to eq(0)
      expect(result.dig("data", "updateReview", "halal")).to eq(0)
      expect(result.dig("data", "updateReview", "kosher")).to eq(0)
      expect(result.dig("data", "updateReview", "nutFree")).to eq(0)
      expect(result.dig("data", "updateReview", "vegan")).to eq(0)
      expect(result.dig("data", "updateReview", "vegetarian")).to eq(0)
      expect(result.dig("data", "updateReview", "likes")).to eq(23)
      expect(result.dig("data", "updateReview", "dislikes")).to eq(1)
    end
  end
end
