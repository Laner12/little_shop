class CategoriesController < ApplicationController

  def show
    @category = Category.find_by(slug: params[:title])
    if @category.nil?
      redirect_to items_path
    else
      @items = @category.items.where(status: 0)
    end
  end
end
