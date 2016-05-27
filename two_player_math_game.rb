#2 player math game
require 'colorize'
require_relative 'player'

class Game
  def initialize(players)
    @num_players = players
    @turns = 0
    @players = []  #an array of players
  end

  def create_players
    @num_players.times do |player|
      puts "Player #{player + 1}, enter your name: "
      name = gets.chomp
      @players << Player.new(name)
    end
    puts "Okay perfect, lets get started!"
  end

  def generate_question
    x = rand(1..20)
    y = rand(1..20)
    syms = [:+, :-, :*, :**, :%]
    operator = syms.sample
    puts "#{@players[@turns].name} What does #{x} #{operator} #{y} equal?"
    x.send(operator, y)
  end

  def get_answer
    gets.chomp.to_i
  end

  def verify_answer(answer, user_answer)
    if answer == user_answer 
      puts "CORRECT!!!".green
    else
      puts "WRONG! The correct answer was #{answer}.".red
      puts "#{@players[@turns].name} loses a life".red
      @players[@turns].lose_life
    end
  end

  def change_turn
    if @turns >= @players.size - 1 
      @turns = 0
    else
      @turns += 1
    end
  end
  def is_dead?
    unless @players[@turns].alive?
      puts "#{@players[@turns].name} is dead!".red
      @turns -= 1
    end
  end

  def output_lives
    @players.each do |player|
      puts "#{player.name} has #{player.lives} lives"
    end
  end

  def game_still_going?
    @players.length > 1
  end

  def remove_losers
    @players.select! do |player|
      player.alive?
    end
  end

  def declare_winner
    puts "#{@players[0].name} is the winner!!!".green
  end

end #end of class 

print "How many players? "
num_players = gets.chomp.to_i
main_game = Game.new(num_players)
main_game.create_players
while main_game.game_still_going?
  answer = main_game.generate_question
  u_answer = main_game.get_answer
  main_game.verify_answer(answer, u_answer)
  main_game.is_dead?
  main_game.remove_losers
  main_game.output_lives
  main_game.change_turn
  
  
end
main_game.declare_winner

