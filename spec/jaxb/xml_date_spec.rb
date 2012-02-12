require "spec_helper"

module Jaxb
  describe XmlDate do
    let (:date_str) do
      date_str = "2012-02-12"
    end

    describe "#parse" do
      it "should parse a date" do
        xml = XmlDate.parse( date_str )

        xml.year.should == 2012
        xml.month.should == 02
        xml.day.should == 12
      end
    end

    describe "#get_date" do
      it "should accept a specific date" do
        xml = XmlDate.get_date( 2012, 02, 12 )

        xml.year.should == 2012
        xml.month.should == 02
        xml.day.should == 12
      end
    end
  end
end
