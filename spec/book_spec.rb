require_relative '../book'
require_relative '../rental'
require_relative '../person'
describe Book do
  before :each do
    @book = Book.new('Title1', 'Author1')
  end

  it 'test book creation' do
    expect(@book).to be_instance_of(Book)
    expect(@book.title).to eq 'Title1'
    expect(@book.author).to eq 'Author1'
  end

  it 'test rental_book method' do
    rental = Rental.new('2022-8-24', @book, Person.new(24, 'saied', parent_permission: true))
    @book.rental_book(rental)
    expect(@book.rentals.length).to eq 1
  end

  it 'test fail to add rental' do
    @book.rental_book('rental')
    expect(@book.rentals.length).to eq 0
  end
end
