require './nameable'
# base decorator
class Decorator < Nameable
  attr_reader :nameable

  def initialize(nameable = Nameable.new())
    super()
    @nameable = nameable
  end

  def correct_name
    @nameable.correct_name
  end
end
