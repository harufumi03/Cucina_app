require 'rails_helper'

RSpec.describe 'ラベルモデル機能', type: :model do
  describe 'バリデーションのテスト' do
    context 'ラベルの名前が空文字の場合' do
      it 'バリデーションに失敗する' do
        label = Label.create(name: '')
        expect(label).not_to be_valid
      end
    end

    context 'ラベルの名前に値があった場合' do
      it 'バリデーションに成功する' do
        label = Label.create(name: 'label1')
        expect(label).to be_valid
      end
    end
  end
end
