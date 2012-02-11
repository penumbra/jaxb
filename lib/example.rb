require 'example/books.rb'
require 'book_data.rb'

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

my_example = Example.new

# create Java representations of several book records
BookData.each {|book| my_example.add( BookData.send( book )) }

puts "marshalling BookData to books.xml file"; t1 = Time.now

my_example.save_xml 'books.xml'; dt = Time.now - t1

puts "completed in #{dt} seconds"
