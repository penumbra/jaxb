require "spec_helper"

module Jaxb
  describe Collection do
    let(:books) do
      books = Books::Books.new
    end

    let (:book_array) do
      book_array = [Books::Book.new, Books::Book.new]
      book_ids = ['123', '456']

      book_array.each_with_index do |book, idx|
        book.item_id = book_ids[idx]
      end

      book_array
    end

    describe "#update" do
      it "should do something" do
        books.update( book_array )

        books.list.size.should == book_array.size
      end
    end

    describe "#add" do
      it "should work" do
        book_array.each do |book|
          books.add( book )
        end

        books.list.size.should == book_array.size
      end
    end

    # ObjectFactory allows you to programatically construct
    # new instances of the Java representation for XML content.
    java_import 'example.books.ObjectFactory'

    describe "#data_type" do
      it "should report a Java instance" do
        books.data_type.class.should == ObjectFactory.new.create_books.class
      end
    end

    describe "#list" do
      it "should report a Java instance" do
        expected = Java::JavaUtil::ArrayList.new
        books.list.class.should == expected.class
      end
    end
  end
end
