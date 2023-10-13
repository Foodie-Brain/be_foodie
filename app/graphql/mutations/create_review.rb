class Mutations::CreateReview < Mutations::BaseMutation
  argument :name, String, required: true
  argument :photo, String #TODO: Make field required
  argument :description, String, required: true
  argument :dairy_free, Integer
  argument :gluten_free, Integer
  argument :halal, Integer
  argument :kosher, Integer
  argument :nut_free, Integer
  argument :vegan, Integer
  argument :vegitarian, Integer
  argument :likes, Integer
  argument :dislikes, Integer
  argument :lat, String, required: true
  argument :lon, String, required: true

  type Types::ReviewType

  def resolve(name:, photo:, description:, dairy_free:, gluten_free:, halal:, kosher:, nut_free:, vegan:, vegitarian:, likes:, dislikes:, lat:, lon:)
    Review.create(name: name, 
      photo: photo, 
      description: description, 
      dairy_free: dairy_free, 
      gluten_free: gluten_free, 
      halal: halal, 
      kosher: kosher, 
      nut_free: nut_free, 
      vegan: vegan, 
      vegitarian: vegitarian, 
      likes: likes, 
      dislikes: dislikes, 
      lat: lat, 
      lon: lon)
  end
end