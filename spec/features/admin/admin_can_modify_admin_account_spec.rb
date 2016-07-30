require 'rails_helper'

RSpec.feature "Logged in admin can alter admin account" do
  scenario "admin can change their account" do
    admin = User.create(username: 'admin', email: 'admin@example.com', password: 'admin', role: 1)

    visit login_path

    fill_in "Username", with: "admin"
    fill_in "Email", with: "admin@example.com"
    fill_in "Password", with: "admin"
    click_button "Login"

    expect(current_path).to eq(admin_dashboard_index_path)
    expect(page).to have_content "Admin Dashboard"
    click_on "Edit My Profile"
    expect(current_path).to eq(edit_user_path(admin))

    fill_in "Username", with: "ADMIN"
    fill_in "Email", with: "admin@example.com"
    fill_in "Password", with: "admin"
    click_button "Update Profile"

    expect(page).to have_content "Logged in as ADMIN"
    expect(current_path).to eq(admin_dashboard_index_path)
  end
end
