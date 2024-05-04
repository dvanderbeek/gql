module Queries
  module BlogQueries
    def self.included(base)
      base.field :posts, [Types::Objects::PostType], null: false
      base.field :comments, [Types::Objects::CommentType], null: false
    end

    def posts
      Post.all
    end

    def comments
      Comment.all
    end
  end
end
