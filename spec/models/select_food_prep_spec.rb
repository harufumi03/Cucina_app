require 'rails_helper'

RSpec.describe "仕込み選択モデル機能", type: :model do
  # let!(:first_user) { FactoryBot.create(:first_user)}
  # let!(:group) { FactoryBot.create(:group) }
  # let!(:food_prep) { FactoryBot.create(:food_prep) }
  before do
    user = User.create(name: "user1", email: "user1@sample.com", password: "111111", password_confirmation: "111111",
                       admin: "true" )
    @current_user = User.find_by(email: "user1@sample.com")
    group = Group.create(name: 'group1', owner_id: @current_user.id)
    @current_group = Group.find_by(name: "group1")
    @food_prep = FoodPrep.create(name: 'トマトソース', ingredient: 'トマト', group_id: @current_group.id )
  end

  describe 'バリデーションのテスト' do
    context '仕込み項目名選択されていない場合' do
      it 'バリデーションに失敗する' do
        select_food_prep = SelectFoodPrep.create(food_prep_id: '', to_do_at: '2022-12-25', user_id: @current_user.id,
                                                 group_id: @current_group.id)
        expect(select_food_prep).to be_invalid
      end
    end

    context '実施日が選択されていない場合' do
      it 'バリデーションに失敗する' do
        select_food_prep = SelectFoodPrep.create(food_prep_id: @food_prep.id, to_do_at: '', user_id: @current_user.id,
                                                 group_id: @current_group.id)
        expect(select_food_prep).to be_invalid
      end
    end

    context 'グループ名が選択されていない場合' do
      it 'バリデーションに失敗する' do
        select_food_prep = SelectFoodPrep.create(food_prep_id: @food_prep.id, to_do_at: '2022-12-25', user_id: @current_user.id,
                                                 group_id: nil)
        expect(select_food_prep).to be_invalid
      end
    end
  end
end
