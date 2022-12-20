require 'rails_helper'

RSpec.describe 'ユーザモデル機能', type: :model do
  describe 'バリデーションのテスト' do
    context 'ユーザの名前が空文字の場合' do
      it 'バリデーションに失敗する' do
        user = User.create(name: "", email: "sample@sample.com", password: "111111", password_confirmation: "111111", 
                           admin: "true" )
        expect(user).not_to be_valid
      end
    end

    context 'ユーザのメールアドレスが空文字の場合' do
      it 'バリデーションに失敗する' do
        user = User.create(name: "user1", email: "", password: "111111", password_confirmation: "111111", admin: "true" )
        expect(user).not_to be_valid
      end
    end

    context 'ユーザのパスワードが空文字の場合' do
      it 'バリデーションに失敗する' do
        user = User.create(name: "user1", email: "sample@sample.com", password: "", password_confirmation: "111111", 
                           admin: "true" )
        expect(user).not_to be_valid
      end
    end

    context 'ユーザのメールアドレスがすでに使用されていた場合' do
      # let!(:first_user) { FactoryBot.create(:user) }
      it 'バリデーションに失敗する' do
        user = User.create(name: "hashimoto", email: "sample@sample.com", password: "111111", password_confirmation: "111111", 
                           admin: "true" )
        second_user = User.create(name: "haru", email: "sample@sample.com", password: "111111", password_confirmation: "111111", 
                                  admin: "true" )
        expect(second_user).not_to be_valid
      end
    end

    context 'ユーザのパスワードが6文字未満の場合' do
      it 'バリデーションに失敗する' do
        user = User.create(name: "hashimoto", email: "sample@sample.com", password: "111", password_confirmation: "111", 
                           admin: "false" )
        expect(user).not_to be_valid
      end
    end

    context 'ユーザの名前に値があり、メールアドレスが使われていない値で、かつパスワードが6文字以上の場合' do
      it 'バリデーションに成功する' do
        user = User.create(name: "hashimoto", email: "sample@sample.com", password: "111111", password_confirmation: "111111", 
                           admin: "true" )
        expect(user).to be_valid
      end
    end
  end
end  


