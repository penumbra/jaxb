require 'spec_helper'

describe "#marshall" do
  include Jaxb   # mixin the Jaxb::marshall method

  let (:books) do
    books = Books::Books.new
  end

  let (:class_path) do 
    class_path = 'example.books'
  end

  let (:book) do
    book = Books::Book.new
  end

  let (:authors) do
    authors = ['Sam Ruby', 'Dave Thomas', 'David Heinemeier Hansson']
  end

  def update_book 
    book.item_id = '307'
    book.name = 'Agile Web Development with Rails'
    book.isbn = 9780977616633
    book.price = '$29.95'
  
    authors.each {|author| book.authors.add(author)}
  end

  it "should fail having no @XmlRootElement" do
    update_book

    error = marshall(book.book_type, class_path)
    error.include?('@XmlRootElement').should == true
  end

  it "should generate xml" do
    update_book
    books.add(book)

    xml = marshall(books.books, class_path)
    
    xml.include?('<ISBN>9780977616633</ISBN>').should == true
  end
end
