require 'rails_helper'

RSpec.describe "admin/posts/new", type: :view do
  before(:each) do
    assign(:post, Post.new(
      title: "MyString",
      content: "MyText"
    ))
  end

  it "renders new admin_post form" do
    render

    assert_select "form[action=?][method=?]", admin_posts_path, "post" do

      assert_select "input[name=?]", "admin_post[title]"

      assert_select "textarea[name=?]", "admin_post[content]"
    end
  end
end
