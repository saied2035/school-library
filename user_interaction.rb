require './create_classes'
# user interactions
class UserInteraction
  attr_reader :create_classes

  def initialize
    @create_classes = CreateClasses.new
  end

  def create_people
    print 'Do you want to create a student (1) or a teacher (2)? [input the number]: '
    choice = gets.chomp
    if choice != '1' && choice != '2'
      puts "\n*** Please enter valid choice: press 1 for create a student or 2 for create a teacher ***\n"
      method(:create_people).call
      return
    end
    create_student if choice == '1'
    create_teacher if choice == '2'
    puts 'Person created successfully'
  end

  def create_book
    print "\nTitle: "
    title = gets.chomp
    print "\nAuthor: "
    author = gets.chomp
    @create_classes.add_book(title, author)
    puts 'Book created successfully'
  end

  def handle_rental
    @create_classes.people_list.length.positive? && @create_classes.book_storage.book_list.length.positive? &&
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
    @create_classes.add_student(age, name, permission_value)
  end

  def create_teacher
    print "\nAge: "
    age = gets.chomp
    print "\nName: "
    name = gets.chomp
    print "\nSpecialization: "
    specialization = gets.chomp
    @create_classes.add_teacher(age, name, specialization)
  end

  def create_rental
    list_book_for_rental
    book_num = gets.chomp
    list_people_for_rental
    person_num = gets.chomp
    print "\nDate: "
    date = gets.chomp
    @create_classes.add_rental(date, book_num.to_i, person_num.to_i)
    puts 'Rental created successfully'
  end

  def list_book_for_rental
    puts 'Select a book from the following list by number'
    @create_classes.book_storage.book_list.each_with_index do |book, i|
      puts "#{i + 1}) Title: \"#{book.title}\", Author: #{book.author}"
    end
  end

  def list_people_for_rental
    puts 'Select a person from the following list by number (not id)'
    @create_classes.people_list.each_with_index do |person, i|
      print "#{i + 1}) [#{person[:type]}] Name: #{person[:value].name}, "
      print "ID: #{person[:value].id}, Age: #{person[:value].age}\n"
    end
  end
end
