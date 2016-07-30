require 'rails_helper'

RSpec.feature "User information is secure from others" do
  scenario "guest attempts to visit a user's show page" do
    place_order

    visit order_path(Order.first)

    expect(page).to have_content("Please login to view this page")
    expect(current_path).to eq(login_path)

    visit dashboard_path

    expect(page).to have_content("Please login to view this page")
    expect(current_path).to eq(login_path)

    visit orders_path

    expect(page).to have_content("Please login to view this page")
    expect(current_path).to eq(login_path)

    visit admin_dashboard_index_path

    expect(page).to have_content("You cannot access admin content!")

    visit items_path
    click_on "Add to Cart"

    expect(page).to have_link("Login or Create Account to Checkout")

    visit edit_user_path(User.first)
    expect(page).to have_content("You cannot access admin content!")
  end

  scenario "logged-in user attempts to visit another user's show page" do
    place_order
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit order_path(Order.first)

    expect(page).to have_content("You do not have the proper permissions to view that page")
    expect(current_path).to eq(dashboard_path)

    visit admin_dashboard_index_path
    expect(page).to have_content("You cannot access admin content!")

    visit edit_user_path(user)
    expect(page).to have_content("You cannot access admin content!")
  end
end

private

def place_order
  user = create(:user)
  create(:item)

  visit login_path
  within('form') do
    fill_in 'Username', with: user.username
    fill_in 'Password', with: 'password'
    click_on 'Login'
  end

  visit items_path
  click_on "Add to Cart"

  visit items_path
  click_on "Add to Cart"
  click_on "Checkout"

  click_on 'Logout'
end
