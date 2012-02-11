require 'example/books.rb'
require 'example_data.rb'

class Example
  # a collection of books
  attr_reader :books

  def initialize
    @books = Books::Books.new
  end

  # add a book to books collection
  def add( book )
    @books.add( Books::Book.new( book ))
  end

  def save_xml( file_name )
    File.open(file_name, 'w+') {|f| f.write( @books.to_xml )}
  end
end

# create an xml document containing four (4) book records
ex = Example.new

ex.add( ExampleData::book1 )
ex.add( ExampleData::book2 )
ex.add( ExampleData::book3 )
ex.add( ExampleData::book4 )

ex.save_xml 'books.xml'