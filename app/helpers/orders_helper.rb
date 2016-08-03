module OrdersHelper
  def verify_user
    unless current_user == @order.user
      flash[:danger] = "You do not have the proper permissions to view that page"
      redirect_to dashboard_path
    end
  end

  def save_order
    @order = Order.create(user: current_user)
    @cart.all_items.each do |item|
      order_item = Item.find(item.id)
      @order.items << order_item
      OrderItem.find_by(order: @order, item: order_item).update(quantity: item.quantity)
    end
  end

  def set_order
    @order = Order.find(params[:id])
  end
end
