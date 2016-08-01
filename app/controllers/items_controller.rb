class ItemsController < ApplicationController

  def index
    @items = Item.where(status: 0)
  end

  def unavailable
    @items = Item.where(status: 1)
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item        = Item.find(params[:id])
    @categories  = Category.all.map{|c| [c.title, c.id]}
    @celebrities = Celebrity.all.map{|c| [c.name, c.id]}
  end

  def update
    item = Item.find(params[:id])

    item.update_attributes(item_params)
    redirect_to item
  end

end
