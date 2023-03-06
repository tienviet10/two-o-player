require './player'
require 'byebug'

# The game class is to control the game logic (keep track of player scores)
class Game
  def initialize(name1, name2)
    @player_one = Player.new(name1)
    @player_two = Player.new(name2)
    @score_one = 3
    @score_two = 3
    @current_player = 1
  end

  def start
    while @score_one > 0 && @score_two > 0
      num1, num2, true_answer = self.random_generator
      answer = self.ask_question(num1, num2)
      self.check_answer(answer, true_answer)
      self.switch_player

      puts '----- NEW RETURN -----' unless @score_one == 0 || @score_two == 0
    end

    self.print_score
  end

  private

  def random_generator
    num1 = rand(1..10)
    num2 = rand(1..10)
    true_answer = num1 + num2
    return num1, num2, true_answer
  end

  def ask_question(num1, num2)
    if @current_player == 1
      puts "#{@player_two.name}: What does #{num1} plus #{num2} equal?"
    else
      puts "#{@player_one.name}: What does #{num1} plus #{num2} equal?"
    end
    answer = gets.chomp
  end

  def check_answer(answer, true_answer)
    if @current_player == 1 && answer.to_i != true_answer
      @score_one = @score_one - 1
      puts "#{@player_two.name}: Seriously? No!"
    elsif @current_player == 2 && answer.to_i != true_answer
      @score_two = @score_two - 1
      puts "#{@player_one.name}: Seriously? No!"
    else
      puts "YES! You are correct."
    end
  end

  def switch_player
    if @current_player == 1
      @current_player = 2
    else
      @current_player = 1
    end
  end

  def print_score
    puts '----- GAME OVER -----'
    if @score_one == 0
      puts "#{@player_two.name} wins with a score of #{@score_two}/3"
    else
      puts "#{@player_one.name} wins with a score of #{@score_one}/3"
    end
    puts 'Good bye'
  end

end

game = Game.new("Viet", "Evil")
game.start