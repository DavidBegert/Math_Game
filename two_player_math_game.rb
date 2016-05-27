#2 player math game
require 'colorize'

def generate_question
  x = rand(1..20)
  y = rand(1..20)
  syms = [:+, :-, :*, :**, :%]
  operator = syms.sample
  puts "Player #{@turn % 2 + 1}: What does #{x} #{operator} #{y} equal?"
  x.send(operator, y)
end

def output_lives
  puts "Player 1 lives: #{@player_1_lives}.
Player 2 lives: #{@player_2_lives}."
end

def verify_answer(answer, user_answer)
  if answer == user_answer 
    puts "CORRECT!!!".green
  else
    if @turn % 2 + 1 == 1
      @player_1_lives -= 1
      puts "WRONG! Player 1 loses a life.".red
      output_lives
    else
      @player_2_lives -= 1
      puts "WRONG! Player 2 loses a life.".red
      output_lives
    end
  end
end

while true
  @player_1_lives = 3
  @player_2_lives = 3
  @turn = 0
  while @player_1_lives > 0 && @player_2_lives > 0
    answer = generate_question
    user_answer = gets.chomp.to_i
    verify_answer(answer, user_answer)
    @turn += 1
  end
  puts "You Lose!!!!!!!".red
  puts "Press 1 to challenge him to a rematch! ".yellow
  play_again = gets.chomp
  break unless play_again == "1"
end

puts "Bye! Come back to play again!"