require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item, :attachImage)
  end

  describe '商品出品機能' do
    context '商品出品がうまくいくとき' do
      it ':name, :explanation, :category_id, :state_id, :shipping_fee_id, :shipping_place_id, :day_id, :price, :image, :user_idが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end
    context '商品出品がうまくいかないとき' do
      it 'nameが空だと登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Name can't be blank"
      end
      it 'explanationが空では登録できない' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Explanation can't be blank"
      end
      it 'category_idが空では登録できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end
      it "category_idが'-'では登録できない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'Category Select'
      end
      it 'state_idが空では登録できない' do
        @item.state_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "State can't be blank"
      end
      it "state_idが'-'では登録できない" do
        @item.state_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'State Select'
      end
      it 'shipping_fee_idが空では登録できない' do
        @item.shipping_fee_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping fee can't be blank"
      end
      it "shipping_fee_idが'-'では登録できない" do
        @item.shipping_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'Shipping fee Select'
      end
      it 'shipping_place_idが空では登録できない' do
        @item.shipping_place_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping place can't be blank"
      end
      it "shipping_place_idが'-'では登録できない" do
        @item.shipping_place_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'Shipping place Select'
      end
      it 'day_idが空では登録できない' do
        @item.day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Day can't be blank"
      end
      it "day_idが'-'では登録できない" do
        @item.day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'Day Select'
      end
      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
      it 'priceが全角では登録できない' do
        @item.price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price Half-width number'
      end
      it 'priceが299以下では登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price Out of setting range'
      end
      it 'priceが10000000以上では登録できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price Out of setting range'
      end
      it 'imageが空では登録できない' do
        @item = FactoryBot.build(:item)
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
    end
  end
end
