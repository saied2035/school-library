require './teacher'
require './student'
require './book_storage'
require './rental'
# create classes
class CreateClasses
  attr_reader :book_storage, :people_list, :rental_list

  def initialize
    @book_storage = BookStorage.new
    @people_list = []
    @rental_list = []
  end

  def add_book(title, author)
    @book_storage.store_book(title,author)
  end

  def add_student(age, name, parent_permission)
    student = Student.new(age, nil, name, parent_permission: parent_permission)
    @people_list.push({ value: student, type: 'Student' })
  end

  def add_teacher(age, name, specialization)
    teacher = Teacher.new(age, specialization, name)
    @people_list.push({ value: teacher, type: 'Teacher' })
  end

  def add_rental(date, book_num, person_num)
    book = @book_list[book_num - 1]
    person = @people_list[person_num - 1][:value]
    rental = Rental.new(date, book, person)
    @rental_list.push(rental)
  end
end
