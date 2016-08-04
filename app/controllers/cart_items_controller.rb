class CartItemsController < ApplicationController
  include ActionView::Helpers::TextHelper
  before_action :set_item, only: [:update, :destroy]

  def create
    item = Item.find(params[:item_id])
    @cart.add_item(item.id)
    session[:cart] = @cart.contents
    flash[:success] = "#{item.title} added to cart successfully. Cart now contains #{pluralize(@cart.total_items, 'item')}."
    redirect_to request.referrer
  end

  def update
    @cart.contents[params[:id].to_s] = params[:item][:quantity].to_i
    flash[:success] = "Quantity of #{@item.title} updated to #{params[:item][:quantity]}."
    redirect_to cart_index_path
  end

  def destroy
    @cart.contents.delete(params[:id])
    flash[:success] = "Successfully removed #{view_context.link_to(@item.title, item_path(@item))} from your cart."
    redirect_to cart_index_path
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end
end
