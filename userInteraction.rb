require './createClasses'
class UserInteraction

  attr_reader :create_classes
  def initialize
    @create_classes = CreateClasses.new
  end

def create_people
  print 'Do you want to create a student (1) or a teacher (2)? [input the number]: '
  choice = gets.chomp
  create_student if choice == '1'
  create_teacher if choice == '2'
  puts 'Person created successfully'
end

def create_book
  print "\nTitle: "
  title = gets.chomp
  print "\nAuthor: "
  author = gets.chomp
  @create_classes.add_book(title,author)
  puts 'Book created successfully'
end

def handle_rental
 @create_classes.people_list.length.positive? && @create_classes.book_list.length.positive? && 
  create_rental
end

 private

 def create_student
  print "\nAge: "
  age = gets.chomp
  print "\nName: "
  name = gets.chomp
  print "\nHas parent permission? [Y/N]: "
  permission_value = gets.chomp
  permission = permission_value.capitalize
  permission_value = true if permission.include?('Y')
  permission_value = false if permission.include?('N')
  @create_classes.add_student(age,name,permission_value)
end

def create_teacher
  print "\nAge: "
  age = gets.chomp
  print "\nName: "
  name = gets.chomp
  print "\nSpecialization: "
  specialization = gets.chomp
  @create_classes.add_teacher(age,name,specialization)
end

def create_rental
  puts 'Select a person from the following list by number (not id)'
  @create_classes.people_list.each_with_index do |person, i|
  puts "#{i + 1}) [#{person[:type]}] Name: #{person[:value].name}, ID: #{person[:value].id}, Age: #{person[:value].age}"
  end
  book_num = gets.chomp

  puts 'Select a book from the following list by number'
  @create_classes.book_list.each_with_index do |book, i|
  puts "#{i + 1}) Title: \"#{book.title}\", Author: #{book.author}"
  end
  person_num = gets.chomp

  print "\nDate: "
  date = gets.chomp
  @create_classes.add_rental(date, book_num.to_i, person_num.to_i)
  puts 'Rental created successfully'
end

end	