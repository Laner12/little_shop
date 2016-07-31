class ChargesController < ApplicationController
  def new
  end

  def create
    @amount = 0

    customer  = Stripe::Customer.create(
      email:  current_user.email,
      source: params[:stripeToken]
    )

    Stripe::Charge.create(
      customer:    customer.id,
      amount:      @amount,
      description: 'Rails Stripe customer',
      currency:    'usd'
    )

    order = Order.find(params[:orderid].to_i)
    order.update(status: 1)
    redirect_to orders_path

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to orders_path
  end
end
