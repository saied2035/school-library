class Rental
	attr_reader :book
	attr_accessor :date
	def initialize(date, book) 
		@date = date
		@book = self.book_rentaled book
	end
	def book_rentaled book 
		if book.class == Book
			@book = book
			book.rental_book self
			return @book 
		end 
        
	end	
end	