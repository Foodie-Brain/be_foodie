# frozen_string_literal: true

module Types
  class ReviewType < Types::BaseObject
    field :id, ID, null: false
    field :name, String
    field :photo, String
    field :description, String
    field :dairy_free, Integer
    field :gluten_free, Integer
    field :halal, Integer
    field :kosher, Integer
    field :nut_free, Integer
    field :vegan, Integer
    field :vegetarian, Integer
    field :likes, Integer
    field :dislikes, Integer
    field :lat, String
    field :lng, String
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
