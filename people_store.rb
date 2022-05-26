# frozen_string_literal: true

require 'json'
require 'create_classes'

# Store people in json file
class StudentStore
  attr_accessor :age, :name, :permission_value, :file

  def initialize(age, name, permission_value)
    @age = age
    @name = name
    @permission_value = permission_value
    @file = File.open('people.json', 'a')
    @create_class = CreateClasses.new
  end

  def store_student
    file = File.read('people.json')
    hash_data = JSON.parse(file)
    hash_data['student'].push({"name": @name, "age": @age, "parent_permission": @permission_value})
    File.write('people.json', JSON.pretty_generate(hash_data))
  end

  def load_people
    file = File.read('people.json')
    hash_data = JSON.parse(file)
    student_list = hash_data['student']
    teacher_list = hash_data['teacher']
    student_list.each { |item| @create_class.add_book(item['age'], item['name'], item['parent_permission']) }
    teacher_list.each { |item| @create_class.add_book(item['age'], item['name'], item['specialization']) }
  end
end

# store teacher data
class TeacherStore
  attr_accessor :age, :name, :specialization

  def initialize(age, name, specialization)
    @age = age
    @name = name
    @specialization = specialization
  end

  def store_teacher
    file = File.read('people.json')
    hash_data = JSON.parse(file)
    hash_data['teacher'].push({ "name": @name, "age": @age, "specialization": @specialization })
    File.write('people.json', JSON.pretty_generate(hash_data))
  end
end
