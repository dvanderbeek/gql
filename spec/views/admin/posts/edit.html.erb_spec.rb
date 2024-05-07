require 'rails_helper'

RSpec.describe "admin/posts/edit", type: :view do
  let(:post) {
    Post.create!(
      title: "MyString",
      content: "MyText"
    )
  }

  before(:each) do
    assign(:post, post)
  end

  it "renders the edit admin_post form" do
    render

    assert_select "form[action=?][method=?]", admin_post_path(post), "post" do

      assert_select "input[name=?]", "admin_post[title]"

      assert_select "textarea[name=?]", "admin_post[content]"
    end
  end
end
