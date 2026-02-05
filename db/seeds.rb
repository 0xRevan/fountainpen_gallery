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
