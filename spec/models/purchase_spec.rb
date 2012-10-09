require 'spec_helper'

describe Purchase do
  let(:items){ FactoryGirl.create_list(:item, 2, price: 10.0)}
  let(:purchase){ FactoryGirl.build(:purchase, :items => items)}

  it "calculates the total" do
    purchase.total.should == 20
  end

  context "import" do
    let(:data){ ["purchaser_name", "item_description", "1.0", 2, "merchant_address", "merchant_name"] }

    it "a purchaser" do
      expect{ Purchase.import(*data) }.to change{Purchaser.count}.from(0).to(1)
    end
    it "an item" do
      expect{ Purchase.import(*data) }.to change{Item.count}.from(0).to(1)
    end
    it "a merchant" do
      expect{ Purchase.import(*data) }.to change{Merchant.count}.from(0).to(1)
    end
    it "items count" do
      expect{ Purchase.import(*data) }.to change{Purchase.first.items.count rescue 0}.from(0).to(2)
    end

    context "finds" do
      before(:all){
        FactoryGirl.create(:purchaser, :name => "purchaser_name")
        FactoryGirl.create(:merchant, :address => "merchant_address", :name => "merchant_name")
      }

      it "a purchaser" do
        expect{ Purchase.import(*data) }.to_not change{Purchaser.count}.by(1)
      end
      it "a merchant" do
        expect{ Purchase.import(*data) }.to_not change{Merchant.count}.by(1)
      end
    end
  end
end
