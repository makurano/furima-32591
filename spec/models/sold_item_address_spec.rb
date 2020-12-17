require 'rails_helper'

RSpec.describe SoldItemAddress, type: :model do
  describe '購入情報の保存' do
    before do
      @sold_item_address = FactoryBot.build(:sold_item_address)
    end

    context '購入情報が保存できるとき' do
      it 'すべての値が正しく入力されていれば保存できる' do
        expect(@sold_item_address).to be_valid
      end
      it 'building_nameが空でも保存できる' do
        @sold_item_address.building_name = ""
        expect(@sold_item_address).to be_valid
      end
    end

    context '購入情報が保存できないとき' do
      # tokenに関するテスト
      it 'tokenが正しく生成されない（カード情報が不正）だと保存できない' do
        @sold_item_address.token = ""
        @sold_item_address.valid?
        expect(@sold_item_address.errors.full_messages).to include("Token can't be blank")
      end
      # postal_codeに関するテスト
      it 'postal_codeが空だと保存できない' do
        @sold_item_address.postal_code = ""
        @sold_item_address.valid?
        expect(@sold_item_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ形式でないと保存できない' do
        @sold_item_address.postal_code = "1234567"
        @sold_item_address.valid?
        expect(@sold_item_address.errors.full_messages).to include("Postal code Input correctly")
      end
      it 'postal_codeが8桁以上だと保存できない' do
        @sold_item_address.postal_code = "1234-5678"
        @sold_item_address.valid?
        expect(@sold_item_address.errors.full_messages).to include("Postal code Input correctly")
      end
      it 'postal_codeが半角英字が含まれていると保存できない' do
        @sold_item_address.postal_code = "123abcd"
        @sold_item_address.valid?
        expect(@sold_item_address.errors.full_messages).to include("Postal code Input correctly")
      end
      it 'postal_codeが全角英字が含まれていると保存できない' do
        @sold_item_address.postal_code = "ａｂｃｄｅｆｇ"
        @sold_item_address.valid?
        expect(@sold_item_address.errors.full_messages).to include("Postal code Input correctly")
      end
      # prefecture_idに関するコード
      it 'prefectureを選択していないと保存できない' do
        @sold_item_address.prefecture_id = ""
        @sold_item_address.valid?
        expect(@sold_item_address.errors.full_messages).to include("Prefecture select")
      end
      # municipalityに関するコード
      it 'municipalityが空だと保存できない' do
        @sold_item_address.municipality = ""
        @sold_item_address.valid?
        expect(@sold_item_address.errors.full_messages).to include("Municipality can't be blank")
      end
      # addressに関するコード
      it 'addressは空だと保存できない' do
        @sold_item_address.address = ""
        @sold_item_address.valid?
        expect(@sold_item_address.errors.full_messages).to include("Address can't be blank")
      end
      # building_nameに関するコード
      
      # phone_numberに関するコード
      it 'phone_numberが空だと保存できない' do
        @sold_item_address.phone_number = ""
        @sold_item_address.valid?
        expect(@sold_item_address.errors.full_messages).to include("Phone number can't be blank", "Phone number Input only number")
      end
      it 'phone_numberが11桁以下だと保存できない' do
        @sold_item_address.phone_number = "0901234567"
        @sold_item_address.valid?
        expect(@sold_item_address.errors.full_messages).to include("Phone number Input only number")
      end
      it 'phone_numberが11桁以上だと保存できない' do
        @sold_item_address.phone_number = "090123456789"
        @sold_item_address.valid?
        expect(@sold_item_address.errors.full_messages).to include("Phone number Input only number")
      end
      it 'phone_numberに半角英字が含まれていると保存できない' do
        @sold_item_address.phone_number = "abcdefghijk"
        @sold_item_address.valid?
        expect(@sold_item_address.errors.full_messages).to include("Phone number Input only number")
      end
      it 'phone_numberに全角英字が含まれていると保存できない' do
        @sold_item_address.phone_number = "ａｂｃｄｅｆｇｈｉｊｋ"
        @sold_item_address.valid?
        expect(@sold_item_address.errors.full_messages).to include("Phone number Input only number")
      end
      it 'phone_numberに日本語が含まれていると保存できない' do
        @sold_item_address.phone_number = "いろはにほへとちりぬる"
        @sold_item_address.valid?
        expect(@sold_item_address.errors.full_messages).to include("Phone number Input only number")
      end
    end
  end
end