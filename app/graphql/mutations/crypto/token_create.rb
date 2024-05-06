# frozen_string_literal: true

module Mutations
  class Crypto::TokenCreate < BaseMutation
    description "Creates a new token"

    field :token, Types::Objects::Crypto::TokenType, null: false

    argument :token_input, Types::Inputs::Crypto::TokenInputType, required: true

    def resolve(token_input:)
      crypto_token = ::Crypto::Token.new(**token_input)
      raise GraphQL::ExecutionError.new "Error creating token", extensions: crypto_token.errors.to_hash unless crypto_token.save

      { token: crypto_token }
    end
  end
end
