class ChargesController < ApplicationController
  include ChargesHelper
  before_action :set_order, only: [:create]

  def new
  end

  def create
    charge_customer
    @order.update(status: 1)
    redirect_to orders_path
    rescue_from_error
  end

  private

  def set_order
    @order = Order.find(params[:orderid])
  end
end
