require 'spec_helper'

module Books
  describe Promotion do
    let (:promotion) do
      promotion = Promotion.new
    end

    describe "#method_missing" do
      it "should set a discount value" do
        promotion.discount= "25%"      
        promotion.promotion_type.discount.should == "25%"
      end
    end
  end
end
