class Game
  attr_accessor :current_player, :next_player, :question
  attr_reader :player_1, :player_2

  def initialize(player_1, player_2)
    @player_1 = player_1
    @player_2 = player_2
    @current_player = player_1
    @next_player = player_2
    @question = Question.new
  end

  def switch_turns
    turn_finished = self.current_player
    self.current_player = self.next_player
    self.next_player = turn_finished
  end

  def ask_question
    self.question.question_reset
    puts "#{self.current_player.name}: #{self.question.question_content}"
    print "> "
    answer = $stdin.gets.chomp

    if self.question.answer == answer.to_i
      puts "Correct answer"
      puts "P1: #{player_1.lives}/3 vs P2: #{player_2.lives}/3"
      self.game_status
    else
      puts "Incorrect answer"
      current_player.lose_life
      puts "P1: #{player_1.lives}/3 vs P2: #{player_2.lives}/3"
      self.game_status
    end
  end

  def play_again
    puts "Would you like to play again? y / n"
    print "> "
    answer = $stdin.gets.chomp
    if answer == "y"
      player_1.reset_lives
      player_2.reset_lives
      self.current_player = player_1
      self.next_player = player_2
      self.ask_question
    else
      puts "Goodbye"
    end
  end

  def game_status
    if player_1.lives == 0
      puts "---- GAME OVER ----"
      puts "Player 2 wins with #{player_2.lives} lives left"
      self.play_again
      player_1.reset_lives
      player_2.reset_lives
    elsif player_2.lives == 0
      puts "---- GAME OVER ----"
      puts "Player 1 wins with #{player_1.lives} lives left"
      self.play_again
    else
      self.switch_turns
      self.ask_question
    end
  end
end