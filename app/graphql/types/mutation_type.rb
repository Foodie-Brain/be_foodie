# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :create_review, mutation: Mutations::CreateReview
    field :destroy_review, mutation: Mutations::DestroyReview
    field :update_review, mutation: Mutations::UpdateReview
  end
end
