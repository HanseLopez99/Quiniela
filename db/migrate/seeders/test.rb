Team.find_or_create_by([{name: "Guatemala"}, {name: "Brazil"}])
User.find_or_create_by([{name: "Juan"}, {name: "Pedro"}])

puts "Test seeders loaded"