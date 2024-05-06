# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :post_update, mutation: Mutations::PostUpdate
    field :token_create, mutation: Mutations::Crypto::TokenCreate
    field :post_create, mutation: Mutations::PostCreate
  end
end
