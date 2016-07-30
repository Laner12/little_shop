class SessionsController < ApplicationController

  def new
    redirect_to dashboard_path if current_user
    session[:previous_url] = request.referrer
  end

  def create
    @user = User.find_by(username: params[:session][:username])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_based_on_referrer
    else
      flash.now[:danger] = "Login information incorrect."
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

  private

  def login_referrer
    session[:previous_url].split('/').last if session[:previous_url]
  end

  def redirect_based_on_referrer
    if login_referrer == 'cart'
      redirect_to cart_index_path
    elsif current_admin?
      redirect_to admin_dashboard_index_path
    else
      redirect_to dashboard_path
    end
  end
end
