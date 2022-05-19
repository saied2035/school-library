require './person'
require './book'
# rental class
class Rental
  attr_reader :book,:person
  attr_accessor :date

  def initialize(date, book, person)
    @date = date
    @book = book_rentaled book
    @person = person_rental person
  end

  def book_rentaled(book)
    book.instance_of?(Book) && (
      @book = book
      book.rental_book(self)
    )
    @book
  end

  def person_rental(person)
    person.kind_of?(Person) && (
      @person = person
      person.person_rentals(self)
    )
    @person
  end
end
