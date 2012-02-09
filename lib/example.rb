require 'example/books.rb'
require 'example_data.rb'

class Example
  attr_reader :books   # represents a collection of books

  def initialize
    @books = Books::Books.new
  end

  def add(book_data)
    book = Books::Book.new

    book_data.each do |key, value|
      if key == :authors
        value.each {|author| book.authors.add(author) }
      else
        # convert key (e.g :name, :isbn, etc) to key= (e.g. :name=, :isbn=, etc)
        method = key.to_s + "=" 
        # invoke the book's setter using the value
        book.send(method.to_sym, value)
      end
    end

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

ex.write_xml 'books.xml'
