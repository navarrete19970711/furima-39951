require "rails_helper"

RSpec.describe PurchaseDeliveryAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    @purchase_delivery_address = FactoryBot.build(:purchase_delivery_address, user_id: user.id)
  end

  describe "配送先情報の保存" do
    context "配送先情報の保存ができるとき" do
      it "すべての値が正しく入力されていれば保存できること" do
        expect(@purchase_delivery_address).to be_valid
      end
      it "user_idが空でなければ保存できる" do
        @purchase_delivery_address.user_id = 1
        expect(@purchase_delivery_address).to be_valid
      end
      it "item_idが空でなければ保存できる" do
        @purchase_delivery_address.item_id = 1
        expect(@purchase_delivery_address).to be_valid
      end
      it "郵便番号が「3桁＋ハイフン＋4桁」の組み合わせであれば保存できる" do
        @purchase_delivery_address.postal_code = "123-4560"
        expect(@purchase_delivery_address).to be_valid
      end
      it "都道府県が「---」以外かつ空でなければ保存できる" do
        @purchase_delivery_address.prefecture_id = 1
        expect(@purchase_delivery_address).to be_valid
      end
      it "市区町村が空でなければ保存できる" do
        @purchase_delivery_address.municipality = "大田区"
        expect(@purchase_delivery_address).to be_valid
      end
      it "番地が空でなければ保存できる" do
        @purchase_delivery_address.street_address = "鷹番1-1-1"
        expect(@purchase_delivery_address).to be_valid
      end
      it "建物名が空でも保存できる" do
        @purchase_delivery_address.building_name = nil
        expect(@purchase_delivery_address).to be_valid
      end
      it "電話番号が11番桁以内かつハイフンなしであれば保存できる" do
        @purchase_delivery_address.phone_number = "08011112222"
        expect(@purchase_delivery_address).to be_valid
      end
    end

    context "配送先情報の保存ができないとき" do
      it "user_idが空だと保存できない" do
        @purchase_delivery_address.user_id = nil
        @purchase_delivery_address.valid?
        expect(@purchase_delivery_address.errors.full_messages).to include("User can't be blank")
      end
      it "item_idが空だと保存できない" do
        @purchase_delivery_address.item_id = nil
        @purchase_delivery_address.valid?
        expect(@purchase_delivery_address.errors.full_messages).to include("Item can't be blank")
      end
      it "郵便番号が空だと保存できないこと" do
        @purchase_delivery_address.postal_code = nil
        @purchase_delivery_address.valid?
        expect(@purchase_delivery_address.errors.full_messages).to include("Postal code can't be blank", "Postal code is invalid. Include hyphen(-)")
      end
      it "郵便番号にハイフンがないと保存できないこと" do
        @purchase_delivery_address.postal_code = "1234567"
        @purchase_delivery_address.valid?
        expect(@purchase_delivery_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it "都道府県が「---」だと保存できないこと" do
        @purchase_delivery_address.prefecture_id = 0
        @purchase_delivery_address.valid?
        expect(@purchase_delivery_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "都道府県が空だと保存できないこと" do
        @purchase_delivery_address.prefecture_id = nil
        @purchase_delivery_address.valid?
        expect(@purchase_delivery_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "市区町村が空だと保存できないこと" do
        @purchase_delivery_address.municipality = nil
        @purchase_delivery_address.valid?
        expect(@purchase_delivery_address.errors.full_messages).to include("Municipality can't be blank")
      end
      it "番地が空だと保存できないこと" do
        @purchase_delivery_address.street_address = nil
        @purchase_delivery_address.valid?
        expect(@purchase_delivery_address.errors.full_messages).to include("Street address can't be blank")
      end
      it "電話番号が空だと保存できないこと" do
        @purchase_delivery_address.phone_number = nil
        @purchase_delivery_address.valid?
        expect(@purchase_delivery_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it "電話番号にハイフンがあると保存できないこと" do
        @purchase_delivery_address.phone_number = "080-1234-5678"
        @purchase_delivery_address.valid?

        expect(@purchase_delivery_address.errors.full_messages).to include("Phone number is invalid")
      end
      it "電話番号が12桁以上あると保存できないこと" do
        @purchase_delivery_address.phone_number = "080123456789"
        @purchase_delivery_address.valid?
        expect(@purchase_delivery_address.errors.full_messages).to include("Phone number is invalid")
      end
    end
  end
end
