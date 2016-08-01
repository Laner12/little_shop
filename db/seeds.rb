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
  order = Order.create.items << item
  OrderItem.find_by(order: order, item: item).update(quantity: 1)
end

orders = Order.all

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

# Create sold-out item
Item.create(
  title: Faker::Commerce.product_name,
  description: Faker::Hipster.paragraph,
  price: Faker::Commerce.price.to_f,
  image_path: Faker::Avatar.image,
  category_id: Category.all.sample.id,
  celebrity_id: Celebrity.all.sample.id,
  status: 1
)

##########################
# hulk = Celebrity.create(name: "Hulk Hogan")
# christopher = Celebrity.crate(name: "Christopher Walken")
# gary = Celebrity.create(name: "Gary Busey")
# cyndi = Celebrity.create(name: "Cyndi Lauper")
# chris = Celebrity.create(name: "Chris Farley")
# flavor = Celebrity.create(name: "Flavor Flave")
# health = Category.create(title: "Health & Beauty")
# kitchen = Category.create(title: "Kitchen")
# Item.create(
#   title: "Quarter Full Bottle of Visine",
#   description: 'It’s no secret in Christopher Walken’s circle of friends that
#   he suffers from chronically dry eyes. He maintains a regular optical
#   prescription through his local Hollywood pharmacy, but was forced to use
#   this Visine when he was unable to locate his prescription drops while
#   filming Hot Island Breeze, a Bollywood romance that was never released
#   in the US. One Fan’s Treasure acquired this bottle when Christopher,
#   while on set, turned to one of our associates, handed him the bottle,
#   and said, “Take this. It’s like God sent down an angel, to kiss my
#   eyeballs. Wow.”',
#   price: 3499.99,
#   category_id: health.id,
#   celebrity_id: christopher.id,
#   image_path: "http://i.imgur.com/be4TQVU.jpg",
#   status: 1
#   )
# Item.create(
#   title: "Toothbrush",
#   description: 'Barely used! This was acquired from Gary’s housecleaner who said,
#    “Mr. Busey likes soft bristle only. This is a medium to hard bristle toothbrush!”',
#   price: 200.01,
#   category_id: health.id,
#   celebrity_id: gary.id,
#   image_path: "http://i.imgur.com/s4Z1p1G.jpg"
# )
# Item.create(
#   title: "Bedazzled Toothbrush",
#   description: 'Upon arrival at the Riviera Hotel & Casino in Las Vegas where Flavor Flave
#   was negotiation another location for his House of Flavor restaurant specializing in fried chicken,
#   Flavor Flave realized his assistant forgot to pack his custom microfiber-coated boar bristle grill polishing
#   toothbrush. One of our associates was on staff at the Riviera at the time and provided this very toothbrush
#   to Flave, who used it for one day until his custom toothbrush could be overnighted to him. Flavor Flave left this
#   beauty on his bathroom counter, and now it can grace yours!'
#   price: 299.99,
#   category_id: health.id,
#   celebrity_id: flavor.id,
#   image_path: "http://i.imgur.com/zVIJ8wJ.png"
# )
# Item.create(
#   title: "Nearly Panned Blue Eyeshadow",
#   description: 'Straight from the set of the 1983 hit music video Girls Wanna
#   Have Fun, this eyeshadow graced the lids of this 80’s pop legend time after time.',
#   price: 80.05,
#   category_id: health.id,
#   celebrity_id: cyndi.id,
#   image_path: "http://i.imgur.com/LGbPdhk.jpg"
# )
# Item.create(
#   title: "1800w Microwave",
#   description: 'Acquired through an estate sale after his passing, this
#   microwave was used by Chris to heat up many of the snacks that fueled his
#   larger than life comedic genius. It only runs for 20 seconds at a time,
#   ensuring that you’ll never over-microwave your hot pockets.',
#   price: 199.99,
#   category_id: kitchen.id,
#   celebrity_id: chris.id,
#   image_path: "http://i.imgur.com/Ea13XQf.jpg"
# )
# Item.create(
#   title: "Almost New Bottle of Baby Oil",
#   description: "Only enough of the oil was used to grease up the Hulkster
#   right before he entered the arena for WrestleMania 20. Once slathered, the
#   Hulk discarded the bottle outside the WrestleMania entranceway where it was
#   scooped up by a security guard who made sure it found its way to One Fan's Treasure!",
#   price: 350.21,
#   category_id: health.id,
#   celebrity_id: hulk.id,
#   image_path: "http://i.imgur.com/7Muqvq2.jpg"
# )
