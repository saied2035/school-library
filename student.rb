require './person'
# child class
class Student < Person
   attr_reader :classroom
  def initialize(age, classroom, name = 'Unknown', parent_permission = true)
    @classroom = self.add_classroom classroom
    super(age, name, parent_permission: parent_permission)
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
  def add_classroom classroom 
      if classroom.class == Classroom
        @classroom = classroom
        classroom.add_student self
        return @classroom
     end
  end  
end
