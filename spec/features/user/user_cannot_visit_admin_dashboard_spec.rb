require 'rails_helper'

RSpec.feature "Registered user cannot view the admin dashboard" do
  scenario "user gets redirected when tyring to view admin dashboard" do
    user = create(:user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit admin_dashboard_index_path

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content "You cannot access admin content!"

    expect(page).to have_link "Logout"
  end
end
