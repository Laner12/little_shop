class OrdersController < ApplicationController
  include OrdersHelper

  before_action :verify_logged_in, only: [:index]
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

end
