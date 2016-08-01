module ApplicationHelper
  def new_user_path?
    request.path == new_user_path
  end

  def admin_edit?
    current_admin? && request.path == edit_user_path(current_user)
  end
end
