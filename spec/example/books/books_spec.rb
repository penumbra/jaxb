require 'spec_helper'

module Books
  describe Books do
    let (:books) do
      books = Books.new
    end

    let (:book_array) do
      book_array = [Book.new, Book.new]
      book_ids = ['123', '456']
      
      book_array.each_with_index do |book, idx|
        book.item_id = book_ids[idx]
      end

      book_array
    end

    describe "#add" do
      it "should add one book" do
        # add one book to books collection
        books.add(book_array[0])

        # books.list attribute => Java::JavaUtil::ArrayList
        book_type = books.list.get(0)

        # the collection should contain the book created here
        book_array[0].data_type.should == book_type
      end
    end

    describe "#update" do
      it "should add multiple books" do
        books.update( book_array )

        # verify collection contains book_array
        books.list.each do |book_type|
          book_array.include?(book_type) == true
        end
      end
    end

    describe "#to_xml" do
      it "should use jaxb to marshall objects to an xml file" do
        # add book_array to books collection
        books.update( book_array )

        # marshall the books into Xml
        xml = books.to_xml

        # inspect the xml output
        xml.include?('<books>').should == true
        xml.include?('<book itemId="123">').should == true
        xml.include?('<book itemId="456">').should == true
      end
    end
  end
end