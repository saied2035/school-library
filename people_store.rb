# frozen_string_literal: true

require 'json'

# Store people in json file
class StudentStore
  attr_accessor :age, :name, :permission_value, :file

  def initialize(age, name, permission_value)
    @age = age
    @name = name
    @permission_value = permission_value
    @create_class = CreateClasses.new
  end

  def store_student
    file = File.read('people.json')
    hash_data = JSON.parse(file)
    hash_data['student'].push({ "name": @name, "age": @age, "parent_permission": @permission_value })
    File.write('people.json', JSON.pretty_generate(hash_data))
  end
end

# store teacher data
class TeacherStore
  attr_accessor :age, :name, :specialization

  def initialize(age, specialization, name)
    @age = age
    @name = name
    @specialization = specialization
  end

  def store_teacher
    file = File.read('people.json')
    hash_data = JSON.parse(file)
    hash_data['teacher'].push({ "age": @age, "specialization": @specialization, "name": @name })
    File.write('people.json', JSON.pretty_generate(hash_data))
  end
end
