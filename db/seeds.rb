(1..5).each do |n|
  Post
    .create_with(content: "Lorem ipsum dolor sit amet")
    .find_or_create_by(title: "Post #{n}")
end
