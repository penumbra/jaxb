require 'spec_helper'

module Books
  describe Books do
    let (:books) do
      books = Books.new
    end

    let (:book_array) do
      book_array = [Book.new, Book.new]
    end

    let (:book_ids) do
      book_ids = ['123', '456']
    end

    def add_books
      idx = 0

      book_array.each do |book|
        book.item_id = book_ids[idx] ; idx += 1
        books.add_book(book)
      end
    end

    describe "#add_book" do
      it "should add one book" do
        books.add_book(book_array[0])

        # books.book_list attribute => Java::JavaUtil::ArrayList
        book_type = books.book_list.get(0)

        # the collection should contain the book created here
        book_array[0].book_type.should == book_type
      end

      it "should add multiple books" do
        add_books

        # verify collection contains book_array
        books.book_list.each do |book_type|
          book_array.include?(book_type) == true
        end
      end
    end

    describe "#save" do
      it "should use jaxb to marshall objects to an xml file" do
        add_books

        # marshall the books into Xml
        books.save 'books.xml'

        # inspect the xml output
        xml = File.read('books.xml') {|io| io.read }
        xml.include?('<books>').should == true
        xml.include?('<book itemId="123">').should == true
        xml.include?('<book itemId="456">').should == true
      end
    end
  end
end
