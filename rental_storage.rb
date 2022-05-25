require 'json'
require './rental'
# rental class
class RentalStorage
  attr_reader :rental_list

  def initialize
    @rental_list = []
  end

  def presaved_rentals(books, people)
    File.exist?('./books.json') && books.length.positive? && people.length.positive? &&
      @rental_list.length != rentals.length && @rental_list.length.positive? && set_rentals(books, people)

    File.write('rentals.json', '{"rentals":[]}') unless File.exist?('./rentals.json')
  end

  def add_rental(date, book, person)
    rental = Rental.new(date, book, person)
    @rental_list.push(rental)
  end

  def store_rentals
    file = File.read('./rentals.json')
    parsed_json = JSON.parse(file)
    edit = []
    @rental_list.each do |rental|
      edit = parsed_json['rentals'].push(
        { 'id' => rental.person.id.to_s, 'date' => rental.date, 'title' => rental.book.title,
          'author' => rental.book.author }
      )
    end
    File.write('./rentals.json', JSON.pretty_generate({ rentals: edit }))
  end

  private

  def set_rentals(books, people)
    rentals = JSON.parse(File.read('./rentals.json'))['rentals']
    rentals.each do |data|
      person = get_person(data['id'].to_i, people)
      book = get_book(data['title'], books)
      rental = Rental.new(data['date'], book, person)
      @rental_list.push(rental)
    end
    File.write('rentals.json', '{"rentals":[]}')
  end

  def get_person(id, people)
    people.select { |person| id == person[:value].id }[0]
  end

  def get_book(title, book_list)
    book_list.select { |book| book.title == title }[0]
  end
end
