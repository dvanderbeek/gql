class Blog
  def self.create_post(attrs, success, failure)
    post = Post.create(**attrs)
    yield post
    post.valid? ? success.call(post) : failure.call(post)
  end

  def self.update_post(post, attrs, success, failure)
    post.update(attrs) ? success.call(post) : failure.call(post)
  end

  def self.load_posts
    Post.all
  end

  def self.load_post(id)
    post = Post.find(id)
  end
end
