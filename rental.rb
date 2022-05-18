class Rental
	attr_reader :book
	attr_accessor :date
	def initialize(date, book, person) 
		@date = date
		@book = self.book_rentaled book
		@person = self.person_rental person
	end
	def book_rentaled book 
		if book.class == Book
			@book = book
			book.rental_book self
			return @book 
		end   
	end
		def person_rental person 
		if person.class == Person
			@person = person
			person.person_rentals self
			return @person 
		end   
	end		
end	