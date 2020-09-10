require 'rails_helper'

describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '出品成功' do
      it 'すべての値が正しく入力されていれば保存できる' do
        expect(@item).to be_valid
      end

      it 'priceが半角数字で登録できる' do
        @item.price = '2000'
        expect(@item).to be_valid
      end
    end

    context '出品失敗' do
      it 'imageが空だと保存できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'nameが空だと保存できない' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it 'explainが空だと保存できない' do
        @item.explain = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Explain can't be blank")
      end

      it 'Priceが空だと保存できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it 'Priceが半角数字ではないと保存できない' do
        @item.price = '２０００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Half-width number.')
      end

      it 'Priceが300以上9999999以下でないと保存できない' do
        @item.price = 200
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Out of setting range')
      end

      it 'Categoryが選択されてないと保存できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category Select')
      end

      it 'Conditionが選択されてないと保存できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Condition Select')
      end

      it 'Feeが選択されてないと保存できない' do
        @item.fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Fee Select')
      end

      it 'Day が選択されてないと保存できない' do
        @item.day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Day Select')
      end

      it 'Areaが選択されてないと保存できない' do
        @item.area_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Area Select')
      end
    end
  end
end
