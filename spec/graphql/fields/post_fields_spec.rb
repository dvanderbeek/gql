require 'rails_helper'
include GraphQL::Testing::Helpers.for(GqlSchema)

RSpec.describe('GraphQL Post field') do
  it 'resolves the Post title' do
    post = Post.create(title: 'My Post Title')
    graphql_post_title = run_graphql_field('Post.title', post)
    expect(graphql_post_title).to eq post.title
  end
end
