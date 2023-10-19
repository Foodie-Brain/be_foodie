require 'rails_helper'
require 'tempfile'

RSpec.describe Mutations::CreateReview, type: :mutation do
  describe 'createReview' do
    let(:name) { "Cinnamon Coffee Cake" }
    let(:description) { "Found this absolutely delicious coffee cake at Kochi coffee, and it's gluten-free!" }
    let(:gluten_free) { 1 }
    let(:lat) { "39.72740886344144" }
    let(:lng) { "-104.93939410569635" }
    let(:file_path) { Rails.root.join('spec', 'fixtures','images', 'test.jpeg') }
    let(:file) { Rack::Test::UploadedFile.new(file_path) }
    let(:photo) do
      ApolloUploadServer::Wrappers::UploadedFile.new(
        ActionDispatch::Http::UploadedFile.new(
          tempfile: file, filename: File.basename(file),
          type: 'image/jpeg'
        )
      )
    end
    let(:mutation) do
      <<~GQL
        mutation createReview($input: CreateReviewInput!) {
          createReview(input: $input) {
            id
            name
            description
            photoUrl
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

    it 'creates a new review' do

      input = {
        name: name,
        description: description,
        photo: photo,
        glutenFree: gluten_free,
        lat: lat,
        lng: lng
      }

      result = BeFoodieBrainSchema.execute(
        mutation, 
        variables: { input: input }
      )

      expect(result["errors"]).to be_nil

      review = Review.last

      # Expected defined attributes from request
      expect(result.dig("data", "createReview", "id")).to eq(review.id.to_s)
      expect(result.dig("data", "createReview", "name")).to eq(name)
      expect(result.dig("data", "createReview", "description")).to eq(description)
      expect(result.dig("data", "createReview", "photoUrl")).to eq(review.photo_url)
      expect(result.dig("data", "createReview", "glutenFree")).to eq(gluten_free)
      expect(result.dig("data", "createReview", "lat")).to eq(lat)
      expect(result.dig("data", "createReview", "lng")).to eq(lng)

      #expected default values not defined in request
      expect(result.dig("data", "createReview", "dairyFree")).to eq(0)
      expect(result.dig("data", "createReview", "halal")).to eq(0)
      expect(result.dig("data", "createReview", "kosher")).to eq(0)
      expect(result.dig("data", "createReview", "nutFree")).to eq(0)
      expect(result.dig("data", "createReview", "vegan")).to eq(0)
      expect(result.dig("data", "createReview", "vegetarian")).to eq(0)
      expect(result.dig("data", "createReview", "likes")).to eq(0)
      expect(result.dig("data", "createReview", "dislikes")).to eq(0)
    end
  end

  describe 'Sad Path - Errors' do
    let(:name) { "Cinnamon Coffee Cake" }
    let(:description) { "Found this absolutely delicious coffee cake at Kochi coffee, and it's gluten-free!" }
    let(:gluten_free) { 1 }
    let(:lat) { "39.72740886344144" }
    let(:lng) { "-104.93939410569635" }
    let(:file_path) { Rails.root.join('spec', 'fixtures','images', 'test.jpeg') }
    let(:file) { Rack::Test::UploadedFile.new(file_path) }
    let(:photo) do
      ApolloUploadServer::Wrappers::UploadedFile.new(
        ActionDispatch::Http::UploadedFile.new(
          tempfile: file, filename: File.basename(file),
          type: 'image/jpeg'
        )
      )
    end
    let(:mutation) do
      <<~GQL
        mutation createReview($input: CreateReviewInput!) {
          createReview(input: $input) {
            id
            name
            description
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

    it 'Returns an error when inavlid input(s) provided' do
      input = {
        name:'',
        photo: photo,
        description: description,
        glutenFree: gluten_free,
        lat: lat,
        lng: lng
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
        lng: lng
      }

      result2 = BeFoodieBrainSchema.execute(
        mutation,
        variables: { input: input2 }
      )

      expect(result2["errors"][0]["message"]).to eq("Name can't be blank, Description can't be blank")
    end
  end

  describe 'Reviews with image files' do
    let(:name) { "Cinnamon Coffee Cake" }
    let(:description) { "Found this absolutely delicious coffee cake at Kochi coffee, and it's gluten-free!" }
    let(:gluten_free) { 1 }
    let(:lat) { "39.72740886344144" }
    let(:lng) { "-104.93939410569635" }
    let(:file_path) { Rails.root.join('spec', 'fixtures','images', 'test.jpeg') }
    let(:file) { Rack::Test::UploadedFile.new(file_path) }
    let(:photo) do
      ApolloUploadServer::Wrappers::UploadedFile.new(
        ActionDispatch::Http::UploadedFile.new(
          tempfile: file, filename: File.basename(file),
          type: 'image/jpeg'
        )
      )
    end
    let(:mutation) { <<~GQL
        mutation createReview($input: CreateReviewInput!) {
          createReview(input: $input) {
            id
            name
            description
            photo
            photoUrl
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
    }

    it 'creates a new review with an image' do    
      input = {
        name: name,
        description: description,
        photo: photo,
        glutenFree: gluten_free,
        lat: lat,
        lng: lng
      }

      expect(Review.count).to eq(0)
      result = BeFoodieBrainSchema.execute(
        mutation, 
        variables: { input: input }
      )

      expect(result["errors"]).to be_nil
      expect(Review.count).to eq(1)

      review = Review.last

      expect(review.photo.attached?).to be true
      expect(review.photo.blob[:filename]).to eq('test.jpeg')
    end
  end
end
