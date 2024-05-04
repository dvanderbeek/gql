# frozen_string_literal: true

module Types
  class Objects::PostType < Types::BaseObject
    implements GraphQL::Types::Relay::Node

    field :id, ID, null: false
    field :title, String
    field :content, String
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :comments, [Types::Objects::CommentType], null: false
  end
end
