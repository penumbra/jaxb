require 'spec_helper'

module Books
  describe Book do
    let (:book) do
      book = Book.new
    end

    let (:item_id) do
      item_id = '307'
    end

    let (:title) do
      title = 'Agile Web Development with Rails'
    end

    let (:isbn) do
      isbn = 9780977616633
    end

    let (:price) do
      price = '$29.95'
    end

    let (:authors) do  
      authors = ['Sam Ruby', 'Dave Thomas', 'David Heinemeier Hansson'] 
    end

    describe "#authors" do
      it "should support one author" do
         book.item_id = item_id
         book.name = title
         book.isbn = isbn
         book.price = price

         book.authors.add(authors[0])
         book.authors.authors_type.author_name.get(0).should == authors[0]
      end

      it "should support multiple authors" do
         book.item_id = item_id
         book.name = title
         book.isbn = isbn
         book.price = price

         authors.each {|author| book.authors.add(author) }

         book.authors.authors_type.author_name.each do |author|
	   authors.include?(author).should == true
         end
      end
    end

    describe "#promotion" do
      it "should allow discounts" do
        book.item_id = item_id
        book.name = title
        book.isbn = isbn
        book.price = price
 
        book.promotion= {:discount => "25%"}
        book.promotion.promotion_type.discount.should == "25%"
      end
    end

    describe "#method_missing" do
      it "sets the item_id property" do
        book.item_id = item_id
        book.book_type.item_id.should == '307'
      end

      it "sets the name property" do
        book.name = title
        book.book_type.name.should == title
      end

      it "sets the isbn property" do
        book.isbn = isbn
        book.book_type.isbn.should == isbn
      end

      it "sets the price property" do
        book.price = price
        book.book_type.price.should == price
      end
    end
  end
end
