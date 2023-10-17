class Mutations::DestroyReview < Mutations::BaseMutation
  argument :id, Integer, required: true

  type Types::ReviewType

  def resolve(id:)
    Review.find(id).destroy
  end
end