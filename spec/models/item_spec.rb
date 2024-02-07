require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品出品できるとき' do
      it '正常に出品できる' do
        expect(@item).to be_valid
      end
      it 'nameが40字以下であれば登録できる' do
        @item.name = Faker::Lorem.characters(number: 40)
        expect(@item).to be_valid
      end
      it 'priceが300円以上であれば登録できる' do
        @item.price = '300'
        expect(@item).to be_valid
      end
      it 'priceが9999999円以下であれば登録できる' do
        @item.price = '9999999'
        expect(@item).to be_valid
      end
      it 'priceが半角数字であれば登録できる' do
        @item.price = '10000'
        expect(@item).to be_valid
      end
      it 'explainが1000字以下であれば登録できる' do
        @item.explain = Faker::Lorem.characters(number: 1000)
        expect(@item).to be_valid
      end
    end



    context '商品出品できないとき' do
      it 'imageが空の場合は登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include ("Image can't be blank")
      end
      it 'nameが空の場合は登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include ("Name can't be blank")
      end
      it 'nameが41字以上の場合は登録できない' do
        @item.name = Faker::Lorem.characters(number: 41)
        @item.valid?
        expect(@item.errors.full_messages).to include ("Name is too long (maximum is 40 characters)")
      end
      it 'explainが空の場合は登録できない' do
        @item.explain = ''
        @item.valid?
        expect(@item.errors.full_messages).to include ("Explain can't be blank")
      end
      it 'explainが1001字以上の場合は登録できない' do
        @item.explain = Faker::Lorem.characters(number: 1001)
        @item.valid?
        expect(@item.errors.full_messages).to include ("Explain is too long (maximum is 1000 characters)")
      end
      it 'category_idが1の場合は登録できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include ("Category can't be blank")
      end
      it 'condition_idが1の場合は登録できない' do
        @item.condition_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include ("Condition can't be blank")
      end
      it 'delivery_charge_idが1の場合は登録できない' do
        @item.delivery_charge_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include ("Delivery charge can't be blank")
      end
      it 'prefecture_idが1の場合は登録できない' do
        @item.prefecture_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include ("Prefecture can't be blank")
      end
      it 'shipping_day_idが1の場合は登録できない' do
        @item.shipping_day_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include ("Shipping day can't be blank")
      end
      it 'priceが空の場合は登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include ("Price can't be blank")
      end
      it 'priceが299円以下の場合は登録できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include ("Price must be greater than or equal to 300")
      end
      it 'priceが10000000円以上の場合は登録できない' do
        @item.price = '10000001'
        @item.valid?
        expect(@item.errors.full_messages).to include ("Price must be less than or equal to 9999999")
      end
      it 'priceが全角数字では登録できない' do
        @item.price = '１００００'
        @item.valid?
        binding.pry
        expect(@item.errors.full_messages).to include ("Price is not a number")
      end
      it 'ユーザーが紐付いていなければ登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
