class Mutations::UpdateReview < Mutations::BaseMutation
  argument :id, Integer, required: true
  argument :name, String, required: false
  argument :photo, String, required: false
  argument :description, String, required: false
  argument :dairy_free, Integer, required: false
  argument :gluten_free, Integer, required: false
  argument :halal, Integer, required: false
  argument :kosher, Integer, required: false
  argument :nut_free, Integer, required: false
  argument :vegan, Integer, required: false
  argument :vegetarian, Integer, required: false
  argument :likes, Integer, required: false
  argument :dislikes, Integer, required: false
  argument :lat, String, required: false
  argument :lon, String, required: false

  type Types::ReviewType

  def resolve(id:, **attributes)
    Review.find(id).tap do |review|
      review.update!(attributes)
    end
  end
end
