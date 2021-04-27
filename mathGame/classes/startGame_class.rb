class StartGame
  attr_reader :player_1, :player_2, :game
  def initialize
    @player_1 = Player.new("Player 1")
    @player_2 = Player.new("Player 2")
    @game = Game.new(player_1, player_2)

    self.game.ask_question
  end
end