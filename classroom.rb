require './student'
# classroom class
class Classroom
  attr_accessor :lablel
  attr_reader :student_array

  def initialize(lablel)
    @lablel = lablel
    @student_array = []
  end

  def add_student(student)
    !@student_array.include?(student) && student.instance_of?(Student) &&
      @student_array.push(student) &&
      student.add_classroom(self)
  end
end
