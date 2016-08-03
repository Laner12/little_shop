class Admin::ItemsController < Admin::BaseController
  before_action :set_item, only: [:edit, :update]

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
  end

  def update
    if @item.update_attributes(item_params)
      flash[:success] = "#{@item.title} updated successfully."
      @item.update_image_path
      redirect_to @item
    else
      flash.now[:danger] = @item.errors.full_messages.join(', ')
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:title,
                                 :description,
                                 :price,
                                 :category_id,
                                 :celebrity_id,
                                 :upload_image)
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
