require 'spec_helper'

module Books
  describe Promotion do
    let (:promotion) do
      promotion = Promotion.new
    end

    describe "#update" do
      it "should support an input hash" do
        promo_data = {:discount => '25%'}
        promotion.update( promo_data )

        promotion.promotion_type.discount.should == "25%"
      end
    end

    describe "#method_missing" do
      it "should set a discount value" do
        promotion.discount= "25%"      
        promotion.promotion_type.discount.should == "25%"
      end
    end
  end
end
