require './teacher'
require './student'
require './book'
require './rental'
class App
	def initialize
		@book_list = []
		@people_list = []
		@rental_list = []
	end

	def add_book(title,author)
		book = Book.new(title,author)
		@book_list.push(book)
	end

	def add_student(age,name,parent_permission)
		student = Student.new(age,nil,name,parent_permission: parent_permission)
		@people_list.push({value:student,type:'Student'})
	end

	def add_teacher(age,name,specialization)
		teacher = Teacher.new(age,specialization,name)
		@people_list.push({value:teacher,type:'Teacher'})
	end

	def add_rental(date,book_num,person_num)
		book = @book_list[book_num-1]
		person = @people_list[person_num-1]
		rental = Rental.new(date,book,person)
		@rental_list.push(rental)
	end

	def display_books
		@book_list.each {|book| puts `Title: "#{book.title}", Author: #{book.author}`}
	end

	def display_people
     @people_list.each do |person|
      puts `[#{person[:type]}] Name: #{{person[:value].name}}, ID: #{person[:value].id}, Age: #{person[:value].age}`
     end 
	end

	def display_rental_for_id(id)
		@rental_list.each do |rental|
		 id == rental.person.id && (
		 	puts `Date: #{rental.date}, Book: "#{rental.book.title}" by #{rental.book.author}`
		 )		
		end
	end
    def choose_person_to_create_rental
     @people_list.each do |person,i|
      puts `[#{i+1}) #{person[:type]}] Name: #{{person[:value].name}}, 
      ID: #{person[:value].id}, Age: #{person[:value].age}`
     end 
    end

    def choose_book_to_create_rental
      @book_list.each {|book,i| puts `#{i+1}) Title: "#{book.title}", Author: #{book.author}`}
    end    	
end	