class Blog
  def self.create_post(attrs, success, failure)
    post = Post.create(**attrs)
    yield post
    post.valid? ? success.call(post) : failure.call(post)
  end
end
