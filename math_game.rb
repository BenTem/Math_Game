require 'colorize'
require 'pry'

class Player

  attr_accessor :name, :lives, :score

  def initialize(name)
    @name = name
    @lives = 3
    @score = 0
    puts "Created new player: #{name}".colorize(:yellow)
  end

  def lose_life
    self.lives -= 1
  end

  def win_point
    self.score += 1
  end

  def reset_lives
    self.lives = 3
  end

end

class ArgumentError < StandardError  
end  

def question_generator(player)
  @num_1 = rand(20)
  @num_2 = rand(20)
  math_signs = [:+, :-, :*]
  math_sign_selector = math_signs.sample

  puts "#{player.name}, what is #{@num_1} #{math_sign_selector} #{@num_2}?".colorize(:cyan)
  input = gets.chomp

  begin
    raise ArgumentError, 'Argument is not numeric' unless input =~ /\A[-+]?[0-9]*\.?[0-9]+\Z/
  rescue ArgumentError
    puts "Warning! Argument is not numeric!"
  end
  if input.to_i == @num_1.send(math_sign_selector, @num_2)
    player.win_point
    puts "You got it! #{player.name} has #{player.lives} lives left!".colorize(:green)
    puts "#{player.name}'s score is #{player.score}."
  else
    player.lose_life
    puts "Wrong, the correct answer is #{@num_1.send(math_sign_selector, @num_2)}".colorize(:light_red)
      if player.lives < 1
        puts "#{player.name} has #{player.lives} lives left. #{player.name} loses!".colorize(:light_red)
        puts "#{player.name}'s score is #{player.score}."
      else
        puts "#{player.name} has #{player.lives} lives left".colorize(:yellow)
        puts "#{player.name}'s score is #{player.score}."
      end
  end
end


def game

  until @name_1.lives == 0 || @name_2.lives == 0
    question_generator(@name_1)
      break if @name_1.lives == 0
    question_generator(@name_2)
  end

  puts "#{@name_1.name}'s score is #{@name_1.score}. #{@name_2.name}'s score is #{@name_2.score}."
  puts "Play again? Y/N"
  input = gets.chomp.downcase.to_s
  if input == 'y'
    @name_1.reset_lives
    @name_2.reset_lives
    game

  end

end

def player_creation
  puts "Player one name:"
  @name_1 = gets.chomp
  @name_1 = Player.new(@name_1)

  puts "Player two name:"
  @name_2 = gets.chomp
  @name_2 = Player.new(@name_2)

  game
end

player_creation





