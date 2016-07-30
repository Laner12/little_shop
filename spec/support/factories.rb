FactoryGirl.define do
  factory :item do
    title
    description "Definitely used by this celebrity at least once"
    price 199.99
    image_path
    category
    celebrity
    factory :sold_out_item do
      status 1
    end
  end

  factory :celebrity do
    name
  end

  factory :category do
    title { generate(:category_title) }
  end

  factory :order do
    user
    items { create_list(:item, 2) }
  end

  factory :user do
    username
    email
    password 'password'
    first_name 'Joe'
    last_name 'Smith'
    address '123 Anywhere St.'
    city 'AnyTown'
    state 'CA'
    zip_code 99999

    factory :admin do
      role 1
    end
  end

  sequence :username do |n|
    "user_#{n}"
  end

  sequence :email do |n|
    "user_#{n}@example.com"
  end

  sequence :name do |n|
    "Celebrity_#{n}"
  end

  sequence :category_title do |n|
    "Category_#{n}"
  end

  sequence :title do |n|
    "Item_#{n}"
  end

  sequence :image_path do |n|
    "https://robohash.org/#{n}"
  end

end
