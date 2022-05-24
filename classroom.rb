require './student'
# classroom class
class Classroom
  attr_accessor :label
  attr_reader :student_array

  def initialize(label)
    @label = label
    @student_array = []
  end

  def add_student(student)
     puts "we are inside method of calssroom"
    !@student_array.include?(student) && student.instance_of?(Student) &&
      @student_array.push(student) &&
      student.add_classroom(self)
  end
end
