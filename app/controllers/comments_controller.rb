class CommentsController < ApplicationController
  private

  def service; Blog; end # derive from model's parent module (Post and Comment should be in Blog namespace)

  def comment_params # extract this and use to define both permitted params and gql input type
    params.require(:comment).permit(:message, :post_id)
  end
end
