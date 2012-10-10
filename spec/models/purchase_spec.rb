require 'spec_helper'

describe Purchase do
  let(:items){ FactoryGirl.create_list(:item, 2, price: 10.0)}
  let(:purchase){ FactoryGirl.build(:purchase, :items => items)}

  it "calculates the total" do
    purchase.total.should == 20
  end

  context "import" do
    let(:data){ ["purchaser_name", "item_description", "1.0", 2, "merchant_address", "merchant_name"] }

    it "a purchase" do
      expect{ Purchase.import(*data) }.to change{Purchase.count}.by(1)
    end
    it "a purchaser" do
      expect{ Purchase.import(*data) }.to change{Purchaser.count}.by(1)
    end
    it "an item" do
      expect{ Purchase.import(*data) }.to change{Item.count}.by(1)
    end
    it "a merchant" do
      expect{ Purchase.import(*data) }.to change{Merchant.count}.by(1)
    end
    it "items count" do
      expect{ Purchase.import(*data) }.to change{Purchase.first.items.count rescue 0}.by(2)
    end

    context "finds" do
      # Notice the let!
      let!(:purchaser){ FactoryGirl.create(:purchaser, :name => "purchaser_name") }
      let!(:merchant){ FactoryGirl.create(:merchant, :address => "merchant_address", :name => "merchant_name") }

      it "a purchaser" do
        expect{ Purchase.import(*data) }.to change{Purchase.first.purchaser rescue nil}.from(nil).to(purchaser)
      end
      it "a merchant" do
        expect{ Purchase.import(*data) }.to change{Purchase.first.merchant rescue nil}.from(nil).to(merchant)
      end
    end
  end
end
