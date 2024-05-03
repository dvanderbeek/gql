# frozen_string_literal: true

module Types
  class Inputs::PostInputType < Types::BaseInputObject
    argument :title, String, required: false
    argument :content, String, required: false
  end
end
