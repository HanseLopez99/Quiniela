task :refresh_points => :environment do
  # For each user, update points based on the board
  User.all.each do |user|
    Board.by_user(user.id).each do |board|
      board.refresh_points
    end
  end  
end