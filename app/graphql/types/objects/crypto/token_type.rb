# frozen_string_literal: true

module Types
  class Objects::Crypto::TokenType < Types::BaseObject
    field :id, ID, null: false
    field :ticker, String
    field :protocol, String
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
