require './app'

def display_app
  puts "\nPlease choose an option by enter a number:"
  puts ['1 - List all books', '2 - List all people', '3 - Create a person',
        '4 - Create a book', '5 - Create a rental', '6 - List all rentals for a given person id',
        '7 - Exit']
end

def create_student(app)
  print "\nAge: "
  age = gets.chomp
  print "\nName: "
  name = gets.chomp
  print "\nHas parent permission? [Y/N]: "
  permission = gets.chomp
  permission = true if 'Yy'.include?(permission)
  permission = false if 'Nn'.include?(permission)
  app.add_student(age.to_i, name, permission)
end

def create_teacher(app)
  print "\nAge: "
  age = gets.chomp
  print "\nName: "
  name = gets.chomp
  print "\nSpecialization: "
  specialization = gets.chomp
  app.add_teacher(age.to_i, name, specialization)
end

def create_people(app)
  print 'Do you want to create a student (1) or a teacher (2)? [input the number]: '
  choice = gets.chomp
  create_student(app) if choice == '1'
  create_teacher(app) if choice == '2'
  puts 'Person created successfully'
end

def create_book(app)
  print "\nTitle: "
  title = gets.chomp
  print "\nAuthor: "
  author = gets.chomp
  app.add_book(title, author)
  puts 'Book created successfully'
end

def create_rental(app)
  app.choose_book_to_create_rental
  book_num = gets.chomp
  app.choose_person_to_create_rental
  person_num = gets.chomp
  print "\nDate: "
  date = gets.chomp
  app.add_rental(date, book_num.to_i, person_num.to_i)
  puts 'Rental created successfully'
end

def handle_rental(app)
  app.people_list.length.positive? && app.book_list.length.positive? && create_rental(app)
end

def list_rental_for_person(app)
  print "\nID of person: "
  id = gets.chomp
  puts 'Rintals:'
  app.display_rental_for_id(id.to_i)
end

def display_books(app)
  app.display_books
end

def display_people(app)
  app.display_people
end

def exit_program
  puts 'Thank you for using this app!'
  exit
end

def choose_action(app)
  decision = gets.chomp
  puts 'please choose of the list' unless '1234567'.include?(decision)
  decision == '7' && exit_program
  methods = [
    method(:display_books), method(:display_people), method(:create_people),
    method(:create_book), method(:handle_rental), method(:list_rental_for_person)
  ]
  '123456'.include?(decision) && methods[decision.to_i - 1].call(app)
end

def main
  puts "\nWelcome to School Library App!\n"
  app = App.new
  loop do
    display_app
    choose_action(app)
  end
end

main
