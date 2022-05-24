class Display 

	def display_books(books)
		books.each { |book| puts "Title: \"#{book.title}\", Author: #{book.author}" }
	end

	def display_people(people)
	 people.each do |person|
        puts "[#{person[:type]}] Name: #{person[:value].name}, ID: #{person[:value].id}, Age: #{person[:value].age}"
      end
	end

	def display_rentals(rentals)
		print "\nId of person: "
		id = gets.chomp.to_i
	  rentals.each do |rental|
      rental.person.id == id && (
        puts "Date: #{rental.date}, Book: \"#{rental.book.title}\" by #{rental.book.author}"
      )	
	  end
	end	
end
