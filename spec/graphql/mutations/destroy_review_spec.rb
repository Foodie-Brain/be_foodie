require 'rails_helper'

RSpec.describe Mutations::DestroyReview, type: :mutation do
  before :each do
    @review = Review.create!(name: "Matcha Mochi Donut", photo: "example.png", description: "Donuts made with Mochi", dairy_free: 0, gluten_free: 0, halal: 0, kosher: 0, nut_free: 0, vegan: 0, vegetarian: 0, likes: 23, dislikes: 1, lat: "39.675827212143645", lng: "-104.8654249015717") 
  end 

  let(:mutation) do
    <<~GQL
      mutation destroyReview($input: DestroyReviewInput!) {
        destroyReview(input: $input) {
          id
          name
        }
      }
    GQL
  end

  it 'deletes a review' do
    input = {
      id: @review.id
    }
    
    expect(Review.all.count).to eq(1)

    result = BeFoodieBrainSchema.execute(
      mutation,
      variables: { input: input }
    )

    expect(result.dig("data", "destroyReview", "id")).to eq(@review.id.to_s)
    expect(result.dig("data", "destroyReview", "name")).to eq(@review.name)

    expect(Review.all.count).to eq(0)
  end

  it 'returns an error if review does not exist' do
    input = {
      id: 999
    }

    result = BeFoodieBrainSchema.execute(
      mutation,
      variables: { input: input }
    )
    expect(result["errors"]).to_not be_nil
    expect(result.dig("data", "destroyReview")).to be_nil
    expect(result.dig("errors", 0, "message")).to eq("Review not found with id: 999")
  end
end
