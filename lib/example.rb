require 'example/books.rb'
require 'example_data.rb'

class Example
  attr_reader :books   # represents a collection of books

  def initialize
    @books = Books::Books.new
  end

  def add(book_data)
    book = Books::Book.new

    book.update( book_data )

    @books.add(book)  # add book to books collection
  end

  def write_xml( file_name )
    # marshall the books into Xml
    xml = @books.to_xml 

    # write to file
    File.open(file_name, 'w+') {|f| f.write(xml)}
  end
end

ex = Example.new

ex.add( ExampleData::book1 )
ex.add( ExampleData::book2 )
ex.add( ExampleData::book3 )
ex.add( ExampleData::book4 )

ex.write_xml 'books.xml'
