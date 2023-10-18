class Mutations::DestroyReview < Mutations::BaseMutation
  argument :id, Integer, required: true

  type Types::ReviewType

  def resolve(id:)
    review = Review.find_by(id: id)

    if review.nil? || review.blank?
      raise GraphQL::ExecutionError, "Review not found with id: #{id}"
    else
      review.destroy
    end
  end
end