class Admin::BaseController < ApplicationController
  before_action :require_admin

  def require_admin
    unless current_admin?
      flash[:danger] = "You cannot access admin content!"
      redirect_to login_path
    end
  end
end
