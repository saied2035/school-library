require './nameable'
# base decorator
class Decorator < Nameable
     def initialize(nameable = Nameable.new())
          @nameable = nameable
     end
     def correct_name 
      @nameable.correct_name 
     end	
end	