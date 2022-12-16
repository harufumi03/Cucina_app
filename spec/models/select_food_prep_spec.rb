require 'rails_helper'

RSpec.describe "仕込み選択モデル機能", type: :model do
  let!(:first_user) { FactoryBot.create(:first_user)}
  let!(:group) { FactoryBot.create(:group) }
  let!(:food_prep) { FactoryBot.create(:food_prep) }
  before do
    @current_user = User.find_by(email: "user1@sample.com")
    @current_group = Group.find_by(name: "group1")
  end

  describe 'バリデーションのテスト' do
    context '仕込み項目名選択されていない場合' do
      it 'バリデーションに失敗する' do
        select_food_prep = SelectFoodPrep.create(food_prep_id: '', to_do_at: '2022-12-25', user_id: @current_user.id, group_id: @current_group.id)
        expect(food_prep).to be_invalid
      end
    end
  end
end
