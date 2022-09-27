json.extract! board, :id, :team1, :team2, :score1, :score2, :created_at, :updated_at
json.url board_url(board, format: :json)
