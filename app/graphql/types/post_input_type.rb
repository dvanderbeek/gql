# frozen_string_literal: true

module Types
  class PostInputType < Types::BaseInputObject
    argument :id, ID, required: false
    argument :title, String, required: false
    argument :content, String, required: false
    argument :created_at, GraphQL::Types::ISO8601DateTime, required: false
    argument :updated_at, GraphQL::Types::ISO8601DateTime, required: false
  end
end
