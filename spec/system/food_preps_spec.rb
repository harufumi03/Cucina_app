require 'rails_helper'

RSpec.describe "FoodPreps", type: :system do
  let!(:first_user) { FactoryBot.create(:first_user) }
  let!(:second_user) { FactoryBot.create(:second_user) }
  before do
    driven_by(:selenium_chrome_headless)
  end
  describe '仕込み管理機能' do
    before do
      visit new_user_session_path
      fill_in 'user_email', with: 'user1@sample.com'
      fill_in 'user_password', with: '111111'
      click_button 'ログイン'
    end
    context 'ログインしグループに属している場合' do
      it '仕込みを登録できる' do
        visit new_group_path
        fill_in 'group_name', with: 'group1'
        click_button '作成する'
        visit new_food_prep_path
        fill_in 'food_prep_name', with: 'トマトソース'
        fill_in 'food_prep_ingredient', with: 'トマト'
        check 'food_prep[group_id]'
        click_on '作成する'
        expect(page).to have_content '仕込みを登録しました'
      end
      it '仕込みを編集できる' do
        visit new_group_path
        fill_in 'group_name', with: 'group1'
        click_button '作成する'
        visit new_food_prep_path
        fill_in 'food_prep_name', with: 'トマトソース'
        fill_in 'food_prep_ingredient', with: 'トマト'
        check 'food_prep[group_id]'
        click_on '作成する'
        visit food_preps_path
        click_on '編集する'
        fill_in 'food_prep_name', with: 'クリームソース'
        fill_in 'food_prep_ingredient', with: '牛乳'
        click_on '編集する'
        expect(page).to have_content '仕込みを編集しました'
      end
      it '仕込みを削除できる' do
        visit new_group_path
        fill_in 'group_name', with: 'group1'
        click_button '作成する'
        visit new_food_prep_path
        fill_in 'food_prep_name', with: 'トマトソース'
        fill_in 'food_prep_ingredient', with: 'トマト'
        check 'food_prep[group_id]'
        click_on '作成する'
        visit food_preps_path
        click_on '削除する'
        expect(page.accept_confirm).to eq '本当に削除しますか？'
        expect(page).to have_content '仕込みを削除しました'
      end
    end
  end
  describe '仕込み表示機能' do
    before do
      visit new_user_session_path
      fill_in 'user_email', with: 'user1@sample.com'
      fill_in 'user_password', with: '111111'
      click_button 'ログイン'
      visit new_group_path
      fill_in 'group_name', with: 'group1'
      click_button '作成する'
    end
    context '仕込みを作成した場合' do
      it '他のグループは作成した仕込みを見ることはできない' do
        visit new_food_prep_path
        fill_in 'food_prep_name', with: 'トマトソース'
        fill_in 'food_prep_ingredient', with: 'トマト'
        check 'food_prep[group_id]'
        click_on '作成する'
        click_on 'menu_button'
        click_on 'ログアウト'
        visit new_user_session_path
        fill_in 'user_email', with: 'user2@sample.com'
        fill_in 'user_password', with: '222222'
        click_button 'ログイン'
        visit food_preps_path
        expect(page).not_to have_content 'トマトソース'
      end
    end
  end
  describe '仕込み検索機能' do
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
    context '仕込み項目名で検索した場合'
      it '検索結果に表示される' do
        fill_in 'q_name_cont', with: 'トマトソース'
        click_on '検索'
        expect(page).to have_content 'トマトソース'
      end
    end
  end    

