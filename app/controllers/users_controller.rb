class UsersController < ApplicationController
  before_action :verify_logged_in, only: [:show]
  before_action :verify_admin, only: [:edit, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      UserNotifierMailer.send_signup_email(@user).deliver
      session[:user_id] = @user.id
      redirect_to dashboard_path
    else
      flash.now[:danger] = @user.errors.full_messages.join(", ")
      render :new
    end
  end

  def show
    redirect_to admin_dashboard_index_path if current_admin?
  end

  def edit
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to admin_dashboard_index_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def verify_admin
    unless current_admin? && current_user.id == params[:id].to_i
      if current_admin?
        flash[:danger] = "Admins can only modify their own accounts"
        redirect_to dashboard_path
      else
        render file: '/public/404', status => 404, :layout => true
      end
    end
  end
end
