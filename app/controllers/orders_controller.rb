class OrdersController < ApplicationController
  before_action :verify_logged_in, only: [:index, :show]
  before_action :set_order, only: [:show]
  before_action :verify_user, only: [:show]

  def index
    @orders = current_user.orders
  end

  def create
    save_order
    session[:cart] = nil
    flash[:success] = "Order was successfully placed"
    redirect_to orders_path
  end

  def show
  end

  private

  def save_order
    order = Order.create(user: current_user)
    @cart.all_items.each do |item|
      order_item = Item.find(item.id)
      order.items << order_item
      OrderItem.find_by(order: order, item: order_item).update(quantity: item.quantity)
    end
  end

  def set_order
    @order = Order.find(params[:id])
  end

  def verify_user
    unless current_user == @order.user
      flash[:danger] = "You do not have the proper permissions to view that page"
      redirect_to dashboard_path
    end
  end
end
