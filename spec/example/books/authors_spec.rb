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

        name = authors.authors_type.get_author_name.get(0)
        name.should == author_names[0]
      end

      it "should add multiple author's" do
        author_names.each do |name|
          authors.add(name)
        end

        authors.authors_type.get_author_name.each do |name|
          author_names.include?(name).should == true
        end
      end
    end
  end
end
