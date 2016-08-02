require 'rails_helper'

RSpec.feature 'Admin creates an item' do
  context 'with valid item infomation and no photo' do
    scenario 'logged-in admin visits the items path' do
      admin = create(:admin)
      categories = create_list(:category, 3)
      celebrity = create(:celebrity)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit items_path
      click_on 'Add New Treasure'

      expect(current_path).to eq(new_admin_item_path)

      fill_in 'Title', with: 'Creamy Ranch Dressing'
      fill_in 'Description', with: "It's not self-indulgent when it's the best. By Newman, for Newman."
      fill_in 'Price', with: 29.99
      select "#{categories.first.title}", from: 'Category'
      select "#{celebrity.name}", from: 'Celebrity'
      click_on 'Add Treasure'

      expect(current_path).to eq(item_path(Item.first))
      expect(page).to have_content(Item.first.title)
      expect(page).to have_content(Item.first.description)
      expect(page).to have_content(Item.first.price)
      expect(page).to have_css("img[src*='#{Item.first.image_path}']")
    end
  end

  context 'with valid information and photo' do
    xscenario 'logged-in admin visits the items path' do

    end
  end

  context 'with invalid item information' do
    xscenario 'logged-in admin visits the items path' do

    end
  end

  context 'unauthorized user' do
    xscenario 'logged-in user visits the items path' do

    end

    xscenario 'visitor visits the items path' do

    end
  end
end
