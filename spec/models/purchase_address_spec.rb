require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    @purchase = FactoryBot.build(:purchase_address)
  end

  describe '商品購入' do
    context '購入成功' do
      it 'すべての値が正しく入力されていれば出品できる' do
        expect(@purchase).to be_valid
      end

      it '建物名が空でも出品できる' do
        @purchase.building = nil
        expect(@purchase).to be_valid
      end
    end

    context '購入失敗' do
      it 'tokenが空だと出品できない' do
        @purchase.token = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Token can't be blank")
      end

      it 'postcodeが空だと出品できない' do
        @purchase.postcode = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Postcode can't be blank")
      end

      it 'prefectureが空だと出品できない' do
        @purchase.prefecture = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include('Prefecture Select')
      end

      it 'Numberが空だと出品できない' do
        @purchase.number = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Number can't be blank")
      end

      it 'Phoneが空だと出品できない' do
        @purchase.phone = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Phone can't be blank")
      end
    end
  end
end
