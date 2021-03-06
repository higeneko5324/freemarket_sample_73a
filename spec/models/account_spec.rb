require 'rails_helper'

RSpec.describe Account, type: :model do
  describe 'account' do
    describe '#create' do
      it "post_numカラムが空白では登録できないこと" do
        account = build(:account, post_num: nil )
        account.valid?
        expect(account.errors[:post_num]).to include("is the wrong length (should be 7 characters)")
        expect(account.errors[:post_num]).to include("can't be blank")
      end

      it "prefecture_idカラムが空白では登録できないこと" do
        account = build(:account, prefecture_id: nil)
        account.valid?
        expect(account.errors[:prefecture_id]).to include("can't be blank")
     end

      it " post_numが8文字以上であれば登録できないこと" do
        account = build(:account, post_num: "12345678")
        account.valid?
        expect(account.errors[:post_num]).to include("is the wrong length (should be 7 characters)")
      end

      it " post_numが6文字以下であれば登録できないこと" do
        account = build(:account, post_num: "123456")
        account.valid?
        expect(account.errors[:post_num]).to include("is the wrong length (should be 7 characters)")
      end

      it "post_numカラムが7文字なら登録できる" do
        user = create(:user)
        account = build(:account)
        expect(account).to be_valid
      end


      it "cityカラムが空白では登録できないこと" do
        account = build(:account, city: nil)
        account.valid?
        puts account.errors.full_messages
        expect(account.errors[:city]).to include("can't be blank")
      end

      it "city_numカラムが空白では登録できないこと" do
        account = build(:account, city_num: nil)
        account.valid?
        puts account.errors.full_messages
        expect(account.errors[:city_num]).to include("can't be blank")
      end
    end
  end
end
