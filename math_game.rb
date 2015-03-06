@player_1 = 3
@player_2 = 3
@play = true


def question_generator_1
  @num_1 = rand(20)
  @num_2 = rand(20)
  puts "Player 1, what is #{@num_1} plus #{@num_2}?"
  input = gets.chomp
  if input == @num_1 + @num_2
    question_generator_2
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
  if input == @num_1 + @num_2
    question_generator_1
  else
    @player_2 = @player_2 - 1
    puts "you have #{@player_2} lives left"
  end
end

def lives
  if @player_1 == 0 || @player_2 == 0
    @play = false
  end
end



def game
  while @play ==   true
    question_generator_1

    question_generator_2
  end
end

game
