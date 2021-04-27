class Player
  attr_reader :name
  attr_accessor :lives

  def initialize(name)
    @name = name
    @lives = 3
  end

  def player_info
    puts "#{name} has #{lives} lives."
  end

  def lose_life
    self.lives -= 1
  end

  def reset_lives
    self.lives = 3
  end
end