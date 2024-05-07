class PostsController < ApplicationController
  private

  def service; Blog; end # derive from model's parent module (Post and Comment should be in Blog namespace)

  def permitted_params # extract this and use to define both permitted params and gql input type
    params.require(:post).permit(:title, :content)
  end
end
