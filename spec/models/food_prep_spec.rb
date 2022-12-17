require 'rails_helper'

RSpec.describe '仕込み作成モデル機能', type: :model do
  before do
    @current_group = Group.create(name: "group1", owner_id:1)
  end
  describe 'バリデーションのテスト' do
    context '仕込み項目名が空文字の場合' do
      it 'バリデーションに失敗する' do
        food_prep = FoodPrep.create(name: '', ingredient: 'トマト', group_id: @current_group.id)
        expect(food_prep).to be_invalid
      end
    end

    context '使用食材が空文字の場合' do
      it 'バリデーションに失敗する' do
        food_prep = FoodPrep.create(name: 'トマトソース', ingredient: '', group_id: @current_group.id)
        expect(food_prep).to be_invalid
      end
    end

    context 'グループが選択されていない場合' do
      it 'バリデーションに失敗する' do
        food_prep = FoodPrep.create(name: 'トマトソース', ingredient: 'トマト', group_id: nil)
        expect(food_prep).to be_invalid
      end
    end

    context '仕込み項目名、使用食材、グループ名に値が入っている場合' do
      it 'バリデーションに成功する' do
        food_prep = FoodPrep.create(name: 'トマトソース', ingredient: 'トマト', group_id: 1,)
        expect(food_prep).to be_invalid
      end
    end
  end
end