@player_1 = 3
@player_2 = 3
@play = true


def question_generator_1
  @num_1 = rand(20)
  @num_2 = rand(20)
  puts "Player 1, what is #{@num_1} plus #{@num_2}?"
  input = gets.chomp
  if input.to_i == @num_1 + @num_2
    puts "You got it! #{@player_1} lives left!"
  else
    @player_1 = @player_1 - 1
    puts "you have #{@player_1} lives left"
  end
end

def question_generator_2
  @num_1 = rand(20)
  @num_2 = rand(20)
  puts "Player 2, what is #{@num_1} plus #{@num_2}?"
  input = gets.chomp
  if input.to_i == @num_1 + @num_2
    puts "You got it! #{@player_2} lives left!"
  else
    @player_2 = @player_2 - 1
    puts "you have #{@player_2} lives left"
  end
end

def lives
  if @player_1 == 0 || @player_2 == 0
     @play = false
     puts "Game over!"
  end
end

def game
  while @play ==   true
    question_generator_1
    lives
      if @player_1 == 0
        break
      end
    question_generator_2
    lives
  end
end

game
