class Mutations::CreateReview < Mutations::BaseMutation
  argument :name, String, required: true
  argument :photo, String # TODO make photo required
  argument :description, String, required: true
  argument :dairy_free, Integer, required: false, default_value: 0
  argument :gluten_free, Integer, required: false, default_value: 0
  argument :halal, Integer, required: false, default_value: 0
  argument :kosher, Integer, required: false, default_value: 0
  argument :nut_free, Integer, required: false, default_value: 0
  argument :vegan, Integer, required: false, default_value: 0
  argument :vegetarian, Integer, required: false, default_value: 0
  argument :likes, Integer, required: false, default_value: 0
  argument :dislikes, Integer, required: false, default_value: 0
  argument :lat, String, required: true
  argument :lon, String, required: true

  type Types::ReviewType

  def resolve(name:, photo:, description:, dairy_free:, gluten_free:, halal:, kosher:, nut_free:, vegan:, vegetarian:, likes:, dislikes:, lat:, lon:)
    Review.create(name: name, 
      photo: photo, 
      description: description, 
      dairy_free: dairy_free, 
      gluten_free: gluten_free, 
      halal: halal, 
      kosher: kosher, 
      nut_free: nut_free, 
      vegan: vegan, 
      vegetarian: vegetarian, 
      likes: likes, 
      dislikes: dislikes, 
      lat: lat, 
      lon: lon)
  end
end