require 'example/books.rb'

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

agile_rails = { 
  :item_id => '307', 
  :name => 'Agile Web Development with Rails', 
  :isbn => 9780977616633, 
  :price => '$29.95', 
  :authors => ['Sam Ruby', 'Dave Thomas', 'David Heinemeier Hansson'],
  :description => 'Ruby on Rails is a framework that makes it easier to develop, deploy, ' + 
    'and maintain web applications. During the months that followed its ' +
    'initial release, Rails went from being an unknown toy to being a ' +
    'worldwide phenomenon, and more important, it has become the ' +
    'framework of choice for the implementation of a wide range of ' +
    'so-called Web 2.0 applications.'}

metaprogramming_ruby = { 
  :item_id => '308', 
  :name => 'Metaprogramming Ruby', 
  :isbn => 1934356476, 
  :price => '$39.95', 
  :authors => ['Paulo Perrotta'],
  :description => 'Ruby inherits characteristics from various languages — Lisp, Smalltalk ' +
    ', C, and Perl, to name a few.  Metaprogramming comes from Lisp ' +
    '(and Smalltalk).  It’s a bit like magic, which makes something ' +
    'astonishing possible.'}

programming_semantic_web = { 
  :item_id => '309', 
  :name => 'Programming the Semantic Web', 
  :isbn => 596153813, 
  :price => '$19.95', 
  :authors => ['Toby Segaram', 'Colin Evans', 'Jamie Taylor'] }

ex.add( agile_rails )
ex.add( metaprogramming_ruby )            
ex.add( programming_semantic_web )

ex.write_xml 'books.xml'
