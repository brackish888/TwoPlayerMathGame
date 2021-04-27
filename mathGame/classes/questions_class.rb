class Question  
  attr_accessor :x, :y, :question_content, :answer

  def set_integer
    return rand(100)
  end

  def initialize
    @x = set_integer
    @y = set_integer
    @question_content = "What does #{x} + #{y} equal?"
    @answer = x + y 
  end

  def question_reset
    self.x = set_integer
    self.y = set_integer
    self.question_content = "What does #{x} + #{y} equal?"
    self.answer = x + y 
  end
end