require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品情報が保存できるとき' do
      it '@itemが適切な値を持つとき保存できる' do
        expect(@item).to be_valid
      end
    end

    context '商品情報が保存できないとき' do
      # 以下、特定の値がからの場合のテスト
      it 'nameが空の場合は登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it 'priceが空の場合は登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it 'textが空の場合は登録できない' do
        @item.text = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end

      it 'category_idが空の場合は登録できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it 'state_idが空の場合は登録できない' do
        @item.state_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("State can't be blank")
      end

      it 'prefecture_idが空の場合は登録できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'ship_day_idが空の場合は登録できない' do
        @item.ship_day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Ship day can't be blank")
      end

      it 'ship_fee_idが空の場合は登録できない' do
        @item.ship_fee_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Ship fee can't be blank")
      end

      it 'imageが空の場合は登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'userが紐付いていないときは登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
      # 以下、priceのバリデーションのテスト
      it 'priceが数値でなければ登録できない' do
        @item.price = 'aa'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end

      it 'priceが300未満の場合は登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end

      it 'priseが9,999,999より大きい場合は登録できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end
      # 以下ActiveHashの要素のテスト

      it 'category_idが1だと登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end

      it 'state_idが1だと登録できない' do
        @item.state_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('State must be other than 1')
      end

      it 'prefecture_idが1だと登録できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture must be other than 1')
      end

      it 'ship_day_idが1だと登録できない' do
        @item.ship_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Ship day must be other than 1')
      end

      it 'ship_fee_idが1だと登録できない' do
        @item.ship_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Ship fee must be other than 1')
      end
    end
  end
end

# bundle exec rspec spec/models/item_spec.rb
