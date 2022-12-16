require 'rails_helper'

RSpec.describe "グループモデル機能", type: :model do
  describe 'バリデーションのテスト' do
    context 'グループの名前が空文字の場合' do
      it 'バリデーションに失敗する' do
        group = FactoryBot.build(:group, name: "")
        expect(group).to be_invalid
      end
    end

    context 'グループ名が20文字を超えた場合' do
      it 'バリデーションに失敗する' do
        group = FactoryBot.build(:group, name: "#{"グループ名"* 5}")
        expect(group).to be_invalid
      end
    end

    context 'グループ名が20文字以内で入力された場合' do
      it 'バリデーションに成功する' do
        group = FactoryBot.create(:group, name: 'グループ名')
        expect(group).to be_valid
      end
    end
  end  
end
