require 'spec_helper'

describe "#to_xml" do
  include Jaxb::Marshal   # mixin the Marshal::to_xml method

  let (:books) do
    books = Books::Books.new
  end

  let (:class_path) do 
    class_path = 'example.books'
  end

  let (:book) do
    book = Books::Book.new
  end

  let (:rails_authors) do
    rails_authors = ['Sam Ruby', 'Dave Thomas', 'David Heinemeier Hansson']
  end

  it "should generate xml" do
    book.item_id = '307'
    book.name = 'Agile Web Development with Rails'
    book.isbn = 9780977616633
    book.price = '$29.95'

    # add a collection of authors  
    book.authors.update( rails_authors )

    # add book to the books collection
    books.add( book )

    # marshal the book object to xml
    @class_path = class_path
    xml = books.to_xml
    
    # verify the xml value
    xml.include?('<ISBN>9780977616633</ISBN>').should == true
  end
end
