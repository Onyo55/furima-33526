require 'rails_helper'

RSpec.describe ChargeForm, type: :model do
  before do
    @charge_form = FactoryBot.build(:charge_form)
  end

  describe '商品購入機能' do
    context '購入ができるとき' do
      it '必要な情報が入力されていれば登録できる' do
        @charge_form.valid?
        expect(@charge_form).to be_valid
      end

      it 'bulidingが空でも登録できる' do
        @charge_form.building = nil
        @charge_form.valid?
        expect(@charge_form).to be_valid
      end
    end

    context '購入ができないとき' do
      it 'postal_codeが空のときは購入できない' do
        @charge_form.postal_code = nil
        @charge_form.valid?
        expect(@charge_form.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'prefecture_idが空のときは購入できない' do
        @charge_form.prefecture_id = nil
        @charge_form.valid?
        expect(@charge_form.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'cityが空のときは購入できない' do
        @charge_form.city = nil
        @charge_form.valid?
        expect(@charge_form.errors.full_messages).to include("City can't be blank")
      end

      it 'blockが空のときは購入できない' do
        @charge_form.block = nil
        @charge_form.valid?
        expect(@charge_form.errors.full_messages).to include("Block can't be blank")
      end

      it 'phone_numberが空のときは購入できない' do
        @charge_form.phone_number = nil
        @charge_form.valid?
        expect(@charge_form.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'tokenが空のときは購入できない' do
        @charge_form.token = nil
        @charge_form.valid?
        expect(@charge_form.errors.full_messages).to include("Token can't be blank")
      end

      it 'user_idが空のときは購入できない' do
        @charge_form.user_id = nil
        @charge_form.valid?
        expect(@charge_form.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idが空のときは購入できない' do
        @charge_form.item_id = nil
        @charge_form.valid?
        expect(@charge_form.errors.full_messages).to include("Item can't be blank")
      end

      it 'postal_codeはハイフンがなければ購入できない' do
        @charge_form.postal_code = '0000000'
        @charge_form.valid?
        expect(@charge_form.errors.full_messages).to include('Postal code is invalid')
      end

      it 'phone_numberに数字以外があると購入できない' do
        @charge_form.phone_number = '123-1234-1234'
        @charge_form.valid?
        expect(@charge_form.errors.full_messages).to include('Phone number is invalid')
      end

      it 'phone_numberは11桁以内でないと登録できない' do
        @charge_form.phone_number = '1234123412341'
        @charge_form.valid?
        expect(@charge_form.errors.full_messages).to include('Phone number is invalid')
      end

      it 'prefecture_idは１以外でないと登録できない' do
        @charge_form.prefecture_id = 1
        @charge_form.valid?
        expect(@charge_form.errors.full_messages).to include("Prefecture must be other than 1")
      end
    end
  end
end

# bundle exec rspec spec/models/charge_form.rb
