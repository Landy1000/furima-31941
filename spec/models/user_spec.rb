require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nickname、email、passwordとpassword_confirmation、last_name、first_name、last_name_kana、first_name_kana、birth_onが存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it "passwordが6文字以上で英数字混合であれば登録できる" do
        @user.password = "aaa000"
        @user.password_confirmation = "aaa000"
        expect(@user).to be_valid
      end
      it "last_nameがひらがなであれば登録できる" do
        @user.last_name = "たなか"
        expect(@user).to be_valid
      end
      it "last_nameがカタカナであれば登録できる" do
        @user.last_name = "タナカ"
        expect(@user).to be_valid
      end
      it "first_nameがひらがなであれば登録できる" do
        @user.first_name = "たろう"
        expect(@user).to be_valid
      end
      it "first_nameがカタカナであれば登録できる" do
        @user.first_name = "タロウ"
        expect(@user).to be_valid
      end
      it "last_name_kanaがカタカナであれば登録できる" do
        @user.last_name_kana = "タナカ"
        expect(@user).to be_valid
      end
      it "first_name_kanaがカタカナであれば登録できる" do
        @user.first_name_kana = "タロウ"
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end
      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it "emailは@がないと登録できない" do
        @user.email = "test"
        @user.valid?
        expect(@user.errors.full_messages).to include "Email is invalid"
      end
      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end
      it "passwordが5文字以下であれば登録できない" do
        @user.password = "aa000"
        @user.password_confirmation = "aa000"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
      end
      it "passwordが英字のみであれば登録できない" do
        @user.password = "aaaaaa"
        @user.password_confirmation = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password には英字と数字の両方を含めて設定してください"
      end
      it "passwordが数字のみであれば登録できない" do
        @user.password = "000000"
        @user.password_confirmation = "000000"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password には英字と数字の両方を含めて設定してください"
      end
      it "passwordが全角では登録できない" do
        @user.password = "ａａａ１１１"
        @user.password_confirmation = "ａａａ１１１"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password には英字と数字の両方を含めて設定してください"
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
      it "last_nameが空では登録できない" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name can't be blank"
      end
      it "last_nameが英字では登録できない" do
        @user.last_name = "Tanaka"
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name 全角文字を使用してください"
      end
      it "last_nameが数字では登録できない" do
        @user.last_name = "１"
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name 全角文字を使用してください"
      end
      it "first_nameが空では登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank"
      end
      it "first_nameが英字では登録できない" do
        @user.first_name = "Taro"
        @user.valid?
        expect(@user.errors.full_messages).to include "First name 全角文字を使用してください"
      end
      it "first_nameが数字では登録できない" do
        @user.first_name = "2"
        @user.valid?
        expect(@user.errors.full_messages).to include "First name 全角文字を使用してください"
      end
      it "last_name_kanaが空では登録できない" do
        @user.last_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kana can't be blank"
      end
      it "last_name_kanaが漢字では登録できない" do
        @user.last_name_kana = "田中"
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kana 全角カナを使用してください"
      end
      it "last_name_kanaがひらがなでは登録できない" do
        @user.last_name_kana = "たなか"
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kana 全角カナを使用してください"
      end
      it "last_name_kanaが英字では登録できない" do
        @user.last_name_kana = "Tanaka"
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kana 全角カナを使用してください"
      end
      it "last_name_kanaが数字では登録できない" do
        @user.last_name_kana = "１"
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kana 全角カナを使用してください"
      end
      it "first_name_kanaが空では登録できない" do
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana can't be blank"
      end
      it "first_name_kanaが漢字では登録できない" do
        @user.first_name_kana = "田中"
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana 全角カナを使用してください"
      end
      it "first_name_kanaがひらがなでは登録できない" do
        @user.first_name_kana = "たなか"
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana 全角カナを使用してください"
      end
      it "first_name_kanaが英字では登録できない" do
        @user.first_name_kana = "Tanaka"
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana 全角カナを使用してください"
      end
      it "first_name_kanaが数字では登録できない" do
        @user.first_name_kana = "１"
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana 全角カナを使用してください"
      end
      it "birth_onが空では登録できない" do
        @user.birth_on = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Birth on can't be blank"
      end
    end
  end
end
