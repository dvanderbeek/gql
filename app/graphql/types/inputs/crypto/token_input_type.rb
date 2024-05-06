# frozen_string_literal: true

module Types
  class Inputs::Crypto::TokenInputType < Types::BaseInputObject
    argument :ticker, String, required: false
    argument :protocol, String, required: false
  end
end
