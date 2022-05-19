require './app'

def display_app
   puts "\nPlease choose an option by enter a number:"	
   puts ["1 - List all books","2 - List all people","3 - Create a person",
         "4 - Create a book","5 - Create a rental","6 - List all rentals for a given person id",
         "7 - Exit"]
end

def create_student(app)
     print "\nAge: "
     age = gets.chomp
     print "\nName: "
     name = gets.chomp
     print "\nHas parent permission? [Y/N]: "
     permission = gets.chomp
     permission = true if permission == 'Y' || permission == 'y'
     permission = false if permission == 'N' || permission == 'n'
     app.add_student(age.to_i,name,permission)	
end

def create_teacher(app)
     print "\nAge: "
     age = gets.chomp
     print "\nName: "
     name = gets.chomp
     print "\nSpecialization: "
     specialization = gets.chomp
     app.add_teacher(age.to_i,name,specialization)	
end

def create_people(app)
     print 'Do you want to create a student (1) or a teacher (2)? [input the number]: '
     choice = gets.chomp
     create_student(app) if choice == '1' 
     create_teacher(app) if choice == '2'
     puts "Person created successfully"
end

def create_book(app)
     print "\nTitle: "
     title = gets.chomp
     print "\nAuthor: "
     author = gets.chomp
     app.add_book(title,author)
     puts "Book created successfully"	
end

def create_rental(app)
     app.people_list.length > 0 && app.book_list.length > 0 && ( 
     puts 'Select a book from the following list by number'
     app.choose_book_to_create_rental
     book_num = gets.chomp
     puts 'Select a person from the following list by number (not id)'
     app.choose_person_to_create_rental
     person_num = gets.chomp
      print "\nDate: "
      date = gets.chomp
     app.add_rental(date,book_num.to_i,person_num.to_i)
     puts "Rental created successfully"
     )
     if app.book_list.length == 0
        puts 'You can\'t create rental because you didn\'t add any books yet.'
     elsif app.people_list.length == 0
        puts 'You can\'t create rental because you didn\'t add any people yet.'
     end     	
end

def list_rental_for_person(app)
	print "\nID of person: "
	id = gets.chomp
    puts "Rintals:"
	app.display_rental_for_id(id.to_i)
end

def choose_action(app)
	decision = gets.chomp
	case decision
    when '1'
     app.display_books
    when '2'
     app.display_people
    when '3'
     create_people(app)	
    when '4'
      create_book(app)
    when '5'
      create_rental(app)
    when '6'
      list_rental_for_person(app)
    when '7'
      puts "Thank you for using this app!"	
      exit
    else
      puts "please choose of the list"        
	end	
end

def main
  puts "\nWelcome to School Library App!\n"
  app = App.new()
  while(1)
   display_app
   choose_action(app)
  end
end

main         	