require './player'
require './question'

player1 = Player.new("player1")
puts "Change name of player1:"
player1.name = gets.chomp
player2 = Player.new("player2")
puts "Change name of player2:"
player2.name = gets.chomp
turn = 1

define_method :new_turn do
  turn += 1
  puts "----- NEW TURN -----"
  puts "P1 Lives: #{player1.lives} P2 Lives: #{player2.lives}"
end

while player1.lives != 0 && player2.lives != 0
  if turn % 2 === 0
    current_player = player2
  else
    current_player = player1
  end

  q = Question.new
  puts "#{current_player.name}: #{q.prompt}"
  player_answer = gets.chomp.to_i

  if player_answer === q.answer
    puts "yes"
    new_turn
  else
    puts "no"
    current_player.lose_life
    if current_player.lives === 0
      puts "----- GAME OVER -----"
      puts "#{current_player.name} ran out of lives!"
      break
    end
    new_turn
  end
end