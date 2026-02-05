admin = User.find_or_create_by!(email_address: "admin@example.com") do |user|
  user.password = "password123"
end

puts "Created admin user: #{admin.email_address}"

pens_data = [
  {
    title: "Pilot Metropolitan",
    description: "The Pilot Metropolitan is an excellent entry-level fountain pen with a smooth stainless steel nib. Its brass body gives it a satisfying weight, and the sleek design makes it suitable for both casual writing and professional settings. Available in fine and medium nibs.",
    price: 29.99
  },
  {
    title: "LAMY Safari",
    description: "A modern classic from Germany, the LAMY Safari features a durable ABS plastic body with an iconic clip design. The triangular grip section helps maintain proper pen posture. It uses LAMY T10 cartridges or the Z28 converter for bottled ink.",
    price: 39.95
  },
  {
    title: "Sailor Pro Gear",
    description: "A premium Japanese fountain pen featuring a 21k gold nib that delivers exceptional writing feedback. The cigar-shaped body and flat ends give it a distinctive look. Sailor nibs are renowned for their pencil-like feedback that many enthusiasts prefer.",
    price: 249.00
  },
  {
    title: "Pelikan M800",
    description: "The Pelikan Souveran M800 is a full-sized luxury pen with a stunning striped resin barrel and 18k gold nib. Its differential piston filling mechanism holds a generous amount of ink. A true workhorse for serious writers.",
    price: 549.00
  },
  {
    title: "TWSBI Eco",
    description: "An affordable demonstrator pen that lets you see the ink sloshing inside. The piston-fill mechanism provides excellent ink capacity, and the #5 JoWo nib writes smoothly out of the box. A favorite among ink enthusiasts.",
    price: 35.00
  },
  {
    title: "Montblanc Meisterstuck 149",
    description: "The flagship pen from Montblanc, the 149 is an icon of luxury writing instruments. Its hand-crafted 18k gold nib, precious resin body, and gold-plated fittings make it one of the most recognizable pens in the world.",
    price: 1100.00
  },
  {
    title: "Platinum 3776 Century",
    description: "Named after the height of Mount Fuji in meters, this pen features a 14k gold nib and Platinum's innovative slip-and-seal cap mechanism that prevents ink from drying out for up to 24 months.",
    price: 89.00
  },
  {
    title: "Kaweco Sport",
    description: "A compact pocket pen with roots dating back to 1935. When posted, it becomes a full-sized writer. The octagonal body design is both practical and elegant. Perfect for carrying in a pocket or small pen case.",
    price: 28.00
  }
]

pens_data.each do |pen_attrs|
  Pen.find_or_create_by!(title: pen_attrs[:title]) do |pen|
    pen.description = pen_attrs[:description]
    pen.price = pen_attrs[:price]
  end
end

puts "Created #{Pen.count} pens"

inks_data = [
  {
    name: "Iroshizuku Kon-Peki",
    brand: "Pilot",
    color: "Blue",
    description: "A vivid cerulean blue ink inspired by the deep blue sky. Part of Pilot's premium Iroshizuku line, it offers exceptional flow, beautiful shading, and a touch of sheen on quality paper. One of the most popular fountain pen inks worldwide.",
    price: 28.00
  },
  {
    name: "Oxblood",
    brand: "Diamine",
    color: "Red",
    description: "A rich, dark red ink reminiscent of dried blood. This deeply saturated ink is popular for journaling and letter writing. Diamine inks are known for their excellent value and wide color range.",
    price: 7.95
  },
  {
    name: "Apache Sunset",
    brand: "Noodler's",
    color: "Orange",
    description: "A vibrant orange ink with dramatic red shading that evokes a desert sunset. One of the best shading inks available. Performs beautifully with wet nibs and absorbent paper.",
    price: 12.50
  },
  {
    name: "Yama-Budo",
    brand: "Pilot",
    color: "Purple",
    description: "A gorgeous wine-berry purple from Pilot's Iroshizuku line. Named after wild mountain grapes, it has a rich magenta-purple hue with lovely shading. Professional enough for office use while still being distinctive.",
    price: 28.00
  },
  {
    name: "Shin-Kai",
    brand: "Sailor",
    color: "Blue-Black",
    description: "A refined blue-black from Sailor's Jentle line. Named after the deep sea, it provides a sophisticated dark blue that is professional and easy to read. Excellent behavior in most fountain pens.",
    price: 20.00
  },
  {
    name: "Emerald of Chivor",
    brand: "J. Herbin",
    color: "Teal",
    description: "A legendary ink with gold shimmer particles suspended in a teal-green base. Named after the Colombian emerald mines, it displays stunning color shifts and sparkle. A favorite among ink collectors.",
    price: 28.00
  },
  {
    name: "Heart of Darkness",
    brand: "Noodler's",
    color: "Black",
    description: "One of the darkest, most saturated black inks on the market. Bulletproof and waterproof once dry, making it ideal for important documents. Fast drying with minimal feathering.",
    price: 12.50
  },
  {
    name: "Ku-Jaku",
    brand: "Pilot",
    color: "Teal",
    description: "A stunning peacock-inspired teal from the Iroshizuku line. It shifts between blue and green depending on the nib wetness and paper. Superb shading properties make every stroke unique.",
    price: 28.00
  }
]

inks_data.each do |ink_attrs|
  Ink.find_or_create_by!(name: ink_attrs[:name]) do |ink|
    ink.brand = ink_attrs[:brand]
    ink.color = ink_attrs[:color]
    ink.description = ink_attrs[:description]
    ink.price = ink_attrs[:price]
  end
end

puts "Created #{Ink.count} inks"
