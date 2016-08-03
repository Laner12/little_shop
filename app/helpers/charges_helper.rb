module ChargesHelper
  def charge_customer
    customer = Stripe::Customer.create(
      email:  current_user.email,
      source: params[:stripeToken]
    )

    Stripe::Charge.create(
      customer:    customer.id,
      amount:      50,
      description: 'Rails Stripe customer',
      currency:    'usd'
    )
  end

  def rescue_from_error
    rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to orders_path
  end
end
