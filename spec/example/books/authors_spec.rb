require 'spec_helper'

module Books
  describe "Authors" do
    let (:authors) do
      authors = Authors.new
    end

    let (:author_names) do
      author_names = ['Sam Ruby', 'Dave Thomas', 'David Heinemeier Hansson']
    end

    describe "#add" do
      it "should add one author" do
        authors.add(author_names[0])

        name = authors.list.get(0)
        name.should == author_names[0]
      end

      it "should add multiple authors" do
        author_names.each do |name|
          authors.add(name)
        end

        authors.list.each do |name|
          author_names.include?(name).should == true
        end
      end
    end

    describe "#update" do
      it "should support adding authors from an array" do
        authors.update( author_names )
        authors.list.length.should == author_names.size
      end
    end
  end
end
