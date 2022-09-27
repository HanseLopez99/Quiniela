Team.find_or_create_by(name: "Guatemala")
Team.find_or_create_by(name: "Brazil")
Team.find_or_create_by(name: "Alemania")
Team.find_or_create_by(name: "Argentina")

Player.find_or_create_by(first_name: "Hansel", last_name: "Lopez", age: 20, email: 1)
Player.find_or_create_by(first_name: "Alejandro", last_name: "Dubón", age: 18, email: 2)
Player.find_or_create_by(first_name: "Eddy", last_name: "Pets", age: 20, email: 3)

puts "Test seeders loaded"