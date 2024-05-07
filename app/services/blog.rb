class Blog
  # TODO: Lots of duplicaiton here. We could pass the model class into abstract methods like
  # Service.load_resources(Post, options)
  # Or have a base service that handles the simple cases and let you override when needed.

  # Requires the service to implement these methods, and the resource should be an AR Model or ActiveModel::Model that implements .valid? and .errors

  # POSTS API
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

  # COMMENTS API
  def self.create_comment(attrs, success, failure)
    comment = Comment.create(**attrs)
    yield comment
    comment.valid? ? success.call(comment) : failure.call(comment)
  end

  def self.update_comment(comment, attrs, success, failure)
    comment.update(attrs) ? success.call(comment) : failure.call(comment)
  end

  def self.load_comments
    Comment.all
  end

  def self.load_comment(id)
    comment = Comment.find(id)
  end
end
