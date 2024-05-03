# frozen_string_literal: true

module Mutations
  class PostCreate < BaseMutation
    description "Creates a new post"

    field :post, Types::Objects::PostType, null: false

    argument :post_input, Types::Inputs::PostInputType, required: true

    def resolve(post_input:)
      post = ::Post.new(**post_input)
      raise GraphQL::ExecutionError.new "Error creating post", extensions: post.errors.to_hash unless post.save

      { post: post }
    end
  end
end
