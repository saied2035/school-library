require './teacher'
require './student'
require './book_storage'
require './rental_storage'
require './people_store'
require 'json'
# create classes
class CreateClasses
  attr_reader :book_storage, :people_list, :rental_storage, :file

  def initialize
    @book_storage = BookStorage.new
    @people_list = []
    @rental_storage = RentalStorage.new
    @book_storage.presaved_books
    @rental_storage.presaved_rentals(@book_storage.book_list, @people_list)
    load_student
    load_teacher
  end

  def load_student
    @file = File.read('people.json')
    hash_data = JSON.parse(@file)
    hash_data['student'].each do |item|
      student = Student.new(item['age'], nil, item['name'], parent_permission: item['parent_permission'])
      @people_list.push({ value: student, type: 'Student' })
    end
  end

  def load_teacher
    @file = File.read('people.json')
    hash_data = JSON.parse(@file)
    hash_data['teacher'].each do |item|
      teacher = Teacher.new(item['age'], item['specialization'], item['name'])
      @people_list.push({ value: teacher, type: 'Teacher' })
    end
  end

  def add_book(title, author)
    @book_storage.add_book(title, author)
  end

  def add_student(age, name, parent_permission)
    @student_list = StudentStore.new(age, name, parent_permission)
    @student_list.store_student
    student = Student.new(age, nil, name, parent_permission: parent_permission)
    @people_list.push({ value: student, type: 'Student' })
  end

  def add_teacher(age, name, specialization)
    @teacher_list = TeacherStore.new(age, specialization, name)
    @teacher_list.store_teacher
    teacher = Teacher.new(age, specialization, name)
    @people_list.push({ value: teacher, type: 'Teacher' })
  end

  def add_rental(date, book_num, person_num)
    book = @book_storage.book_list[book_num - 1]
    person = @people_list[person_num - 1][:value]
    rental_storage.add_rental(date, book, person)
  end
end
