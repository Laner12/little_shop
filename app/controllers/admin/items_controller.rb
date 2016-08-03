class Admin::ItemsController < Admin::BaseController
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

  def edit
    @item = Item.find(params[:id])
  end

  def update
    item = Item.find(params[:id])
    if item.update_attributes(item_params)
      item.update_image_path
      redirect_to item
    else
      flash.now[:danger] = item.errors.full_messages.join(', ')
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:title, :description, :price, :category_id, :celebrity_id, :upload_image)
  end

end
