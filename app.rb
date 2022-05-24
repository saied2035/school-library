require './display'
require './createClasses'
# app class
class App
  attr_reader :create_classes
  def initialize
    @create_classes = CreateClasses.new
  end

  def add_book(title, author)
      @create_classes.add_book(title,author)
  end

  def add_student(age, name, parent_permission)
      @create_classes.add_student(age,name,parent_permission)
  end

  def add_teacher(age, name, specialization)
      @create_classes.add_teacher(age,name,specialization)
  end

  def add_rental(date, book_num, person_num)
      @create_classes.add_rental(date, book_num, person_num)
  end

  def display_books
    Display.new.display_books(@create_classes.book_list)
  end

  def display_people
     Display.new.display_people(@create_classes.people_list)
  end

  def display_rental_for_id(id)
    Display.new.display_rentals(id,@create_classes.rental_list)
  end

  def choose_person_to_create_rental
    puts 'Select a person from the following list by number (not id)'
    @create_classes.people_list.each_with_index do |person, i|
      puts "#{i + 1}) [#{person[:type]}] Name: #{person[:value].name},"
      + " ID: #{person[:value].id}, Age: #{person[:value].age}"
    end
  end

  def choose_book_to_create_rental
    puts 'Select a book from the following list by number'
    @create_classes.book_list.each_with_index do |book, i|
      puts "#{i + 1}) Title: \"#{book.title}\", Author: #{book.author}"
    end
  end
end
