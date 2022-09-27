
# Team.find_or_create_by([{name: "Alemania"}, {name: "Argentina"}])
# User.find_or_create_by([{name: "Juan"}, {name: "Pedro"}])

Team.find_or_create_by(name: "Guatemala")
Team.find_or_create_by(name: "Brazil")
Team.find_or_create_by(name: "Alemania")
Team.find_or_create_by(name: "Argentina")

Player.find_or_create_by(first_name: "Juan", last_name: "Perez", age: 20, email: 1)
Player.find_or_create_by(first_name: "Pedro", last_name: "Perez", age: 20, email: 2)
Player.find_or_create_by(first_name: "Juan", last_name: "Perez", age: 20, email: 3)
Player.find_or_create_by(first_name: "Pedro", last_name: "Perez", age: 20, email: 4)

puts "Develpment seeders loaded"