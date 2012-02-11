require 'spec_helper'

module Jaxb
  describe Properties do
    let (:rails_authors) do
      rails_authors = ['Sam Ruby', 'Dave Thomas', 'David Heinemeier Hansson']
    end

    let (:book) do
      book = Books::Book.new
    end

    describe "#update" do
      it "should set multiple attributes from a hash" do
        hash = {:item_id => '411',
                :name => 'Agile Web Development with Rails',
                :price => '$29.95'}

        book.update( hash )

        book.item_id.should == hash[:item_id]
        book.name.should == hash[:name]
        book.price.should == hash[:price]
      end
    end

    describe "#method_missing" do
      it "should support set and get operators" do
        book.item_id = '411'
        book.item_id.should == '411'
      end

      it "should raise an exception when using an invalid method" do
        lambda { book.invalid_method = 'does not work'}.should raise_error(NoMethodError)
      end
    end
  end
end