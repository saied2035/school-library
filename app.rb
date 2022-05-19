require './teacher'
require './student'
require './book'
require './rental'
class app
	def initialize
		@bookList = []
		@peopleList = {student:[],teacher:[]}
		@rentalList = []
	end
	def add_book(title,author)
		book = Book.new(title,author)
		@bookList.push(book)
	end
	def add_student(age,name,parent_permission)
		student = Student.new(age,nil,name,parent_permission: parent_permission)
		@peopleList[:student].push(student)
	end
	def add_teacher(age,name,specialization)
		teacher = Teacher.new(age,specialization,name)
		@peopleList[:teacher].push(teacher)
	end
	def add_rental(date,book,person)
		rental = Rental.new(date,book,person)
		@rentalList.push(rental)
	end		
end	