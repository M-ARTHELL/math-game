require './player'
require './question'

player1 = Player.new
player2 = Player.new
q = Question.new
turn = 1

define_method :new_turn do
  turn += 1
  q = Question.new
  puts "----- NEW TURN -----"
  puts "P1 Lives: #{player1.lives} P2 Lives: #{player2.lives}"
end

while player1.lives != 0 && player2.lives != 0
  if turn % 2 === 0
    current_player = {player: player2, name: "Player 2"}
  else
    current_player = {player: player1, name: "Player 1"}
  end

  puts "#{current_player[:name]}: What does #{q.num1} + #{q.num2} equal?"
  player_answer = gets.chomp.to_i

  if player_answer === q.answer
    puts "yes"
    current_player[:player].add_points
    new_turn
  else
    puts "no"
    current_player[:player].lose_life
    if current_player[:player].lives === 0
      puts "----- GAME OVER -----"
      puts "#{current_player[:name]} ran out of lives!"
      puts "P1 Score: #{player1.points} P2 Score: #{player2.points}"
      break
    end
    new_turn
  end
end