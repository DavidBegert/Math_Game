#2 player math game
@player_1_lives = 3
@player_2_lives = 3
@turn = 0

def generate_question
  x = rand(1..20)
  y = rand(1..20)
  puts "Player #{@turn % 2 + 1}: What does #{x} + #{y} equal?"
  x + y
end

# def prompt_player_for_answer
#   gets.chomp.to_i
# end

def verify_answer(answer, user_answer)
  if answer == user_answer 
    puts "CORRECT!!!"
  else
    if @turn % 2 + 1 == 1
      @player_1_lives -= 1
      puts "Wrong! Player 1 loses a life. Player 1 is now at #{@player_1_lives} lives."
    else
      @player_2_lives -= 1
      puts "Wrong! Player 2 loses a life. Player 2 is now at #{@player_2_lives} lives."
    end
  end
end

while @player_1_lives > 0 && @player_2_lives > 0
  answer = generate_question
  user_answer = gets.chomp.to_i
  verify_answer(answer, user_answer)
  @turn += 1
end

puts "You Lose!!!!!!!"