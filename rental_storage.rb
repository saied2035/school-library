require 'json'
require './rental'
# rental class
class RentalStorage
  attr_reader :rental_list

  def initialize
    @rental_list = []
  end

  def presaved_rentals(books, people)
    File.exist?('./rentals.json') && books.length.positive? && people.length.positive? &&
    @rental_list.length.zero? && set_rentals(books, people)

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
    @rental_list.length != parsed_json['rentals'].length &&  @rental_list.length.positive? &&
    ( 
      @rental_list.each do |rental|
      edit = parsed_json['rentals'].push(
        { 'id' => rental.person.id.to_s, 'browerer' => rental.person.name,
          'date' => rental.date, 'title' => rental.book.title,'author' => rental.book.author }
      )
    end
    File.write('./rentals.json', JSON.pretty_generate({ rentals: edit }))
    )
  end

  private

  def set_rentals(books, people)
      rentals = JSON.parse(File.read('./rentals.json'))['rentals']
      rentals.each do |data|
      person = get_person(data['browerer'], people)
      book = get_book(data['title'], books)
      rental = Rental.new(data['date'], book, person)
      @rental_list.push(rental)
      end
      edit_IDS
  end

  def get_person(browerer, people)
    people.select { |person| person[:value].name == browerer  }[0][:value]
  end

  def get_book(title, book_list)
    book_list.select { |book| book.title == title }[0]
  end

  def edit_IDS
    file = File.read('./rentals.json')
    parsed_json = JSON.parse(file)
    @rental_list.each_with_index do |rental,i|
      parsed_json['rentals'][i]['id'] = rental.person.id.to_s
    end
    File.write('./rentals.json', JSON.pretty_generate(parsed_json))   
  end
end
