task :calculate_points do
  Board.all.each do |board|
    board.insert_points
  end

  users = User.all

  users.each do |user|
    current_points = 0
    bets = Bet.all.where(:users_id => user.id).map do |bet|
      current_points = current_points + bet.points
    end
    user.points = current_points
    user.save!
  end
end