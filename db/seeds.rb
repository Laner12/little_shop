def category_selection
  [
    { title: "Cleaning Supplies" },
    { title: "Kitchen" },
    { title: "Personal Hygiene" },
    { title: "Clothing" },
    { title: "Tools" },
    { title: "Refuse" },
    { title: "Miscellaneous" }
  ]
end

category_selection.each { |cat| Category.create(cat) }

5.times do
  Celebrity.create(name: Faker::Name.name)
end

20.times do
  Item.create(
    title: Faker::Commerce.product_name,
    description: Faker::Hipster.paragraph,
    price: Faker::Commerce.price.to_f,
    image_path: Faker::Avatar.image,
    category_id: Category.all.sample.id,
    celebrity_id: Celebrity.all.sample.id
  )
end

Item.all.each do |item|
  Order.create.items << item
end

orders = Order.all`

20.times do
  User.create(
    username: Faker::Internet.user_name,
    email: Faker::Internet.safe_email,
    password: 'password',
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    address: Faker::Address.street_address,
    city: Faker::Address.city,
    state: Faker::Address.state_abbr,
    zip_code: Faker::Address.zip_code,
  ).orders << orders.shuffle.pop
end
