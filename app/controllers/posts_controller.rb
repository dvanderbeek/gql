class PostsController < ApplicationController
  private

  def service; Blog; end # derive from model's parent module (Post and Comment should be in Blog namespace)
  def resource_klass; Post; end # derive from name of controller
  def resource_name; :post; end # derive from name of controller

  def permitted_params # extract this and use to define both permitted params and gql input type
    params.require(:post).permit(:title, :content)
  end
end
