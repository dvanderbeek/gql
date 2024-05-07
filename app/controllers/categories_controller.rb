class CategoriesController < ApplicationController
  private

  def service; Blog; end

  def category_params
    params.require(:category).permit(:name)
  end
end
