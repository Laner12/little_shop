require 'rails_helper'

RSpec.feature 'Adjust the quantity of an item in the cart' do
  scenario 'visitor with item in cart visits the cart page' do
    item = create(:item)
    visit items_path

    within("#item-#{item.id}") do
      click_on 'Add to Cart'
    end

    visit cart_index_path

    within("#item-#{item.id}") do
      expect(page).to have_content(item.title)
      expect(page).to have_content(1)
    end

    within("#item-#{item.id}") do
      select(3, from: "item[quantity]")
      click_on "Update Qty"
    end

    expect(current_path).to eq(cart_index_path)

    within("#item-#{item.id}") do
      expect(page).to have_content(3)
      expect(page).to have_content("$#{item.price * 3}")
    end

    expect(page).to have_content("Total: $#{item.price * 3}")

    within("#item-#{item.id}") do
      select(1, from: "item[quantity]")
      click_on "Update Qty"
    end

    expect(current_path).to eq(cart_index_path)

    within("#item-#{item.id}") do
      expect(page).to have_content(1)
      expect(page).to have_content(item.price)
    end

    expect(page).to have_content("Total: $#{item.price}")
  end
end
