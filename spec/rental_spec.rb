require_relative '../rental'
require_relative '../person'
require_relative '../book'

describe Rental do
  before :each do
  person = Person.new(24, 'saied', parent_permission: true)
  book = Book.new('Author1','Title1')  
	@rental = Rental.new("12-12-2022",book,person)
  end

  	 it "test rental creation" do
  	 	 expect(@rental).to be_instance_of(Rental)
  	 	 expect(@rental.person).to be_instance_of(Person)
       expect(@rental.book).to be_instance_of(Book)
       expect(@rental.date).to eq "12-12-2022"
  	 end

  	 it "test add rentaled book  method" do
       test_rental = Rental.new("24-4-2023",nil,nil)
  	 	 book = Book.new('Title2','Author2')
  	 	test_rental.book_rentaled(book)
  	 	 expect(test_rental.book.title).to eq "Title2"
  	 end

  	it "test fail to add rentaled book" do
  	 	 test_rental = Rental.new("28-7-2023",nil,nil)
       test_rental.book_rentaled("book")
       expect(test_rental.book).to eq nil
    end

     it "test person_rental  method" do
       test_rental = Rental.new("24-4-2023",nil,nil)
       person = Person.new(30, 'Ahmed', parent_permission: true)
       test_rental.person_rental(person)
       expect(test_rental.person.name).to eq "Ahmed"
     end

    it "test fail person_rental" do
       test_rental = Rental.new("28-7-2023",nil,nil)
       test_rental.person_rental("person")
       expect(test_rental.person).to eq nil
    end    
end	