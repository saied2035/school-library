require 'json'
require './book'
class BookStorage
	attr_reader :book_list

	def initialize
		@book_list = [] 
		presaved_books
	end

	def presaved_books
		File.exists?('./books.json') && (
		books = JSON.parse(File.read('./books.json'))['books']
		books.each do |data|
          book = Book.new(data['title'],data['author']) 
          @book_list.push(book)
		end
	   )	
		File.write('books.json','{"books":[]}') unless File.exists?('./books.json')
	end

	def store_book(title,author)
		file = File.read('./books.json')
		parsed_json = JSON.parse(file)
		edit = parsed_json['books'].push({'title'=> "#{title}",'author'=> "#{author}" })
        File.write('./books.json', JSON.pretty_generate({books: edit}))
        book = Book.new(title,author) 
        @book_list.push(book)     
	end	
end
