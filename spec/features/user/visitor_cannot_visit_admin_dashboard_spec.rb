require 'rails_helper'

RSpec.feature "Visitor cannot view the admin dashboard" do
  scenario "visit gets redirected when tyring to view admin dashboard" do
    visit admin_dashboard_index_path

    expect(current_path).to eq(login_path)
    expect(page).to have_content "You cannot access admin content!"

    expect(page).to have_link "Login"
  end
end
