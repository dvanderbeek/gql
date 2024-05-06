module Queries
  module BlogQueries
    def self.included(base)
      base.field :posts, [Types::Objects::PostType], null: false
      base.field :post, Types::Objects::PostType, null: false do
        argument :id, type: Integer, required: true
      end
      base.field :comments, [Types::Objects::CommentType], null: false
    end

    def post(args)
      Post.find(args[:id])
    end

    def posts
      Post.all
    end

    def comments
      Comment.all
    end
  end
end

# NOTE: GraphQL gem appears to want you to use the `node` and `nodes` queries and global id's to retrieve objects
# rather than implementing individual queries for various objects. Example from one of their docs pages on testing:

# it "loads posts by ID" do
#   query_string = <<-GRAPHQL
#     query($id: ID!){
#       node(id: $id) {
#         ... on Post {
#           title
#           id
#           isDraft
#           comments(first: 5) {
#             nodes {
#               body
#             }
#           }
#         }
#       }
#     }
#   GRAPHQL

#   post = create(:post_with_comments, title: "My Cool Thoughts")
#   post_id = MySchema.id_from_object(post, Types::Post, {})
#   result = MySchema.execute(query_string, variables: { id: post_id })

#   post_result = result["data"]["node"]
#   # Make sure the query worked
#   assert_equal post_id, post_result["id"]
#   assert_equal "My Cool Thoughts", post_result["title"]
# end
