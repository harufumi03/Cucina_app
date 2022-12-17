require 'rails_helper'

RSpec.describe "FoodPreps", type: :system do
  let!(:first_user) { FactoryBot.create(:first_user) }
  let!(:second_user) { FactoryBot.create(:second_user) }
  before do
    driven_by(:selenium_chrome_headless)
  end
  describe '仕込み選択管理機能' do
    before do
      visit new_user_session_path
      fill_in 'user_email', with: 'user1@sample.com'
      fill_in 'user_password', with: '111111'
      click_button 'ログイン'
      visit new_group_path
      fill_in 'group_name', with: 'group1'
      click_button '作成する'
      visit new_food_prep_path
      fill_in 'food_prep_name', with: 'トマトソース'
      fill_in 'food_prep_ingredient', with: 'トマト'
      check 'food_prep[group_id]'
      click_on '作成する'
    end
    context 'ログインしグループに属している場合' do
      it '仕込みを選択できる' do
        visit new_select_food_prep_path
        select 'トマトソース', from: 'select_food_prep_food_prep_id'
        fill_in 'select_food_prep_to_do_at', with: '002022-12-17'
        check 'select_food_prep[group_id]'
        click_on '追加する'
        expect(page).to have_content '仕込みを選択しました'
      end
      it '選択した仕込みを削除できる' do
        visit new_select_food_prep_path
        select 'トマトソース', from: 'select_food_prep_food_prep_id'
        fill_in 'select_food_prep_to_do_at', with: '002022-12-17'
        check 'select_food_prep[group_id]'
        click_on '追加する'
        visit select_food_preps_path
        click_on '削除'
        expect(page.accept_confirm).to eq '本当に削除しますか？'
        expect(page).to have_content '仕込みを削除しました'
      end
      it '選択した仕込みがカレンダーに表示される' do
        visit new_select_food_prep_path
        select 'トマトソース', from: 'select_food_prep_food_prep_id'
        fill_in 'select_food_prep_to_do_at', with: '002022-12-20'
        check 'select_food_prep[group_id]'
        click_on '追加する'
        expect(page).to have_content 'トマトソース'
      end
      it '実施日が当日のものだけテーブルに表示される' do
        visit new_select_food_prep_path
        select 'トマトソース', from: 'select_food_prep_food_prep_id'
        fill_in 'select_food_prep_to_do_at', with: '002022-12-17'
        check 'select_food_prep[group_id]'
        click_on '追加する'
        expect(page).to have_content '2022-12-17'
      end
      it '実施日が当日以外のものはテーブルに表示されない' do
        visit new_select_food_prep_path
        select 'トマトソース', from: 'select_food_prep_food_prep_id'
        fill_in 'select_food_prep_to_do_at', with: '002022-12-20'
        check 'select_food_prep[group_id]'
        click_on '追加する'
        expect(page).not_to have_content '2022-12-20'
      end
    end
  end    
end    

