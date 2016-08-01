health = Category.create(title: "Health & Beauty")
kitchen = Category.create(title: "Kitchen")
cleaning = Category.create(title: 'Cleaning')
bathroom = Category.create(title: 'Bathroom')
entertainment = Category.create(title: 'Entertainment')

jt = Celebrity.create(name: 'Justin Timberlake')
jtt = Celebrity.create(name: 'Jonathan Taylor Thomas')
attenborough = Celebrity.create(name: 'Sir David Attenborough')
hulk = Celebrity.create(name: "Hulk Hogan")
christopher = Celebrity.crate(name: "Christopher Walken")
gary = Celebrity.create(name: "Gary Busey")
cyndi = Celebrity.create(name: "Cyndi Lauper")
chris = Celebrity.create(name: "Chris Farley")
flavor = Celebrity.create(name: "Flavor Flave")

Item.create(
  title: 'Broken Swiffer',
  description: "When times are tough and you're cleaning your own home,\
  it's easy to imagine the frustration that arises when your trusty \
  Swiffer finally scrubs its last floor. But with great frustration \
  comes great perspiration, and JTT's sweat on this one-of-a-kind item \
  is what makes it truly special.",
  price: 44.99,
  image_path: 'http://i.imgur.com/ymvr4Qd.jpg',
  category: cleaning,
  celebrity: jtt
)

Item.create(
  title: 'Half-full Throat Spray',
  description: "You know him from every nature documentary ever \
  produced, and now you can unlock the secret behind his buttery, \
  informative voice with this partially-used bottle of throat coat \
  spray. You won't quite be kissing Mr. Attenborough, but sharing \
  this bottle will surely be enough to pique the interests of even \
  your most staunch dinner guests.",
  price: 109.99,
  image_path: 'http://i.imgur.com/69bNRtH.jpg',
  category: health,
  celebrity: attenborough
)

Item.create(
  title: 'Malfunctioning Bidet',
  description: "Perhaps one of our greatest treasures: hit-maker, \
  actor, and all-around world superstar Justin Timberlake's personal \
  bidet. Although tempting, this particular item is not recommended \
  for use, due to the malfunction of the pressure limiter of the spray \
  nozzle. Buyer beware, this rare gem comes with a scare!",
  price: 1099.99,
  image_path: 'http://i.imgur.com/LeTdTmw.jpg',
  category: bathroom,
  celebrity: jt,
  status: 1
)

Item.create(
  title: 'Justin Timberlake N*Sync Doll',
  description: "Worlds have collided with this unique item. Owned by \
  Sir David Attenborough, revealing both his good taste and a rare \
  glimpse into his private taste in both music and style is this \
  N*Sync era doll of Justin Timberlake. Originally equipped with a \
  pull string that would deliver snippets of songs, this feature is \
  no longer functioning due to overuse by Mr. Attenborough.",
  price: 249.99,
  image_path: 'http://i.imgur.com/bOZoSV8.jpg',
  category: entertainment,
  celebrity: attenborough
)

Item.create(
  title: 'Glee Season 2 Soundtrack (CD)',
  description: "Priced at a very special fifty-TWO dollars, this CD \
  shows plenty of scratches from apparent regular use by superstar \
  Justin Timberlake. Making this item extra special, the liner notes \
  have all original song titles scratched out and replaced with the \
  words 'Cry Me a River'.",
  price: 52.00,
  image_path: 'http://i.imgur.com/cLgVDRa.png',
  category: entertainment,
  celebrity: jt
)

Item.create(
  title: "Quarter Full Bottle of Visine",
  description: 'It’s no secret in Christopher Walken’s circle of friends that
  he suffers from chronically dry eyes. He maintains a regular optical
  prescription through his local Hollywood pharmacy, but was forced to use
  this Visine when he was unable to locate his prescription drops while
  filming Hot Island Breeze, a Bollywood romance that was never released
  in the US. One Fan’s Treasure acquired this bottle when Christopher,
  while on set, turned to one of our associates, handed him the bottle,
  and said, “Take this. It’s like God sent down an angel, to kiss my
  eyeballs. Wow.”',
  price: 3499.99,
  category: health,
  celebrity: christopher,
  image_path: "http://i.imgur.com/be4TQVU.jpg",
  status: 1
)

Item.create(
  title: "Toothbrush",
  description: 'Barely used! This was acquired from Gary’s housecleaner who said,
   “Mr. Busey likes soft bristle only. This is a medium to hard bristle toothbrush!”',
  price: 200.01,
  category: health,
  celebrity: gary,
  image_path: "http://i.imgur.com/s4Z1p1G.jpg"
)

Item.create(
  title: "Bedazzled Toothbrush",
  description: 'Upon arrival at the Riviera Hotel & Casino in Las Vegas where Flavor Flave
  was negotiation another location for his House of Flavor restaurant specializing in fried chicken,
  Flavor Flave realized his assistant forgot to pack his custom microfiber-coated boar bristle grill polishing
  toothbrush. One of our associates was on staff at the Riviera at the time and provided this very toothbrush
  to Flave, who used it for one day until his custom toothbrush could be overnighted to him. Flavor Flave left this
  beauty on his bathroom counter, and now it can grace yours!'
  price: 299.99,
  category: health,
  celebrity: flavor,
  image_path: "http://i.imgur.com/zVIJ8wJ.png"
)

Item.create(
  title: "Nearly Panned Blue Eyeshadow",
  description: 'Straight from the set of the 1983 hit music video Girls Wanna
  Have Fun, this eyeshadow graced the lids of this 80’s pop legend time after time.',
  price: 80.05,
  category: health,
  celebrity: cyndi,
  image_path: "http://i.imgur.com/LGbPdhk.jpg"
)

Item.create(
  title: "1800w Microwave",
  description: 'Acquired through an estate sale after his passing, this
  microwave was used by Chris to heat up many of the snacks that fueled his
  larger than life comedic genius. It only runs for 20 seconds at a time,
  ensuring that you’ll never over-microwave your hot pockets.',
  price: 199.99,
  category: kitchen,
  celebrity: chris,
  image_path: "http://i.imgur.com/Ea13XQf.jpg"
)

Item.create(
  title: "Almost New Bottle of Baby Oil",
  description: "Only enough of the oil was used to grease up the Hulkster
  right before he entered the arena for WrestleMania 20. Once slathered, the
  Hulk discarded the bottle outside the WrestleMania entranceway where it was
  scooped up by a security guard who made sure it found its way to One Fan's Treasure!",
  price: 350.21,
  category: health,
  celebrity: hulk,
  image_path: "http://i.imgur.com/7Muqvq2.jpg"
)
