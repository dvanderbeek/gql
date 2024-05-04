# frozen_string_literal: true
require_relative '../../services/blog'

module Mutations
  class PostCreate < BaseMutation
    description "Creates a new post"

    field :post, Types::Objects::PostType, null: false

    argument :post_input, Types::Inputs::PostInputType, required: true

    def resolve(post_input:)
      Blog.create_post(post_input, method(:success), method(:failure))
    end

    def success(post)
      { post: post }
    end

    def failure(post)
      raise GraphQL::ExecutionError.new "Error creating post", extensions: post.errors.to_hash unless post.save
    end
  end
end
