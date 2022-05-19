require './classroom'
require './person'
# child class
class Student < Person
  attr_reader :classroom

  def initialize(age, classroom, name = 'Unknown', parent_permission: true)
    @classroom = add_classroom classroom
    super(age, name, parent_permission: parent_permission)
  end

  def play_hooky
    "¯\(ツ)/¯"
  end

  def add_classroom(classroom)
    classroom.instance_of?(Classroom) && (
      @classroom = classroom
      classroom.add_student(self)
    )
    @classroom
  end
end
