class Question
  attr_accessor :num1, :num2, :answer, :prompt

  def initialize
    @operator_array = ["+", "-", "*", "/"]
    @operator = @operator_array.sample
    @num1 = rand(1..10)
    @num2 = rand(1..10)
    @answer = @num1.send(@operator, @num2)
    @prompt = "What does #{@num1} #{@operator} #{@num2} equal?"
  end
end