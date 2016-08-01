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

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:success] = 'Treasure added successfully'
      redirect_to @item
    else
      flash.now[:danger] = @item.errors.full_messages.join(', ')
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:title, :description, :price, :category_id, :celebrity_id, :image_path)
  end

end
