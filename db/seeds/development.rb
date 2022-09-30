
Team.find_or_create_by(name: "Guatemala")
Team.find_or_create_by(name: "Brazil")
Team.find_or_create_by(name: "Alemania")
Team.find_or_create_by(name: "Argentina")
Team.find_or_create_by(name: "Mexico")
Team.find_or_create_by(name: "Colombia")

Phase.find_or_create_by(description: "Final")
Phase.find_or_create_by(description: "Semifinal")
Phase.find_or_create_by(description: "Cuartos de final")
Phase.find_or_create_by(description: "Octavos de final")
Phase.find_or_create_by(description: "Grupos")

User.create(first_name: "Pedro", last_name: "Perez", age: 21, email: "pedro@gmail.com", password: "123456", password_confirmation: "123456")
User.create(first_name: "Juan", last_name: "Fernandez", age: 25, email: "juan@gmail.com", password: "123456", password_confirmation: "123456")
User.create(first_name: "Maria", last_name: "Gomez", age: 19, email: "maria@gmail.com", password: "123456", password_confirmation: "123456")
User.create(first_name: "Luis", last_name: "Gonzalez", age: 22, email: "luis@gmail.com", password: "123456", password_confirmation: "123456")

Game.find_or_create_by(phases_id: 1, team1_id: 1, team2_id: 2, team1_score: 1, team2_score: 0)
Game.find_or_create_by(phases_id: 1, team1_id: 3, team2_id: 4, team1_score: 6, team2_score: 2)
Game.find_or_create_by(phases_id: 2, team1_id: 5, team2_id: 6, team1_score: 1, team2_score: 4)
Game.find_or_create_by(phases_id: 2, team1_id: 7, team2_id: 8, team1_score: 1, team2_score: 1)

Board.find_or_create_by(games_id: 1, users_id: 1, score1: 1, score2: 0)
Board.find_or_create_by(games_id: 1, users_id: 2, score1: 3, score2: 4)
Board.find_or_create_by(games_id: 1, users_id: 3, score1: 1, score2: 1)
Board.find_or_create_by(games_id: 1, users_id: 4, score1: 1, score2: 0)
Board.find_or_create_by(games_id: 2, users_id: 1, score1: 1, score2: 2)
Board.find_or_create_by(games_id: 2, users_id: 2, score1: 4, score2: 5)
Board.find_or_create_by(games_id: 2, users_id: 3, score1: 3, score2: 2)
Board.find_or_create_by(games_id: 2, users_id: 4, score1: 1, score2: 2)

puts "Develpment seeders loaded"