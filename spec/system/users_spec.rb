require 'rails_helper'

RSpec.describe 'ユーザ管理機能', type: :system do
  before do
    driven_by(:selenium_chrome_headless)
  end
  describe '登録機能' do
    context 'アカウントを登録した場合' do
      it 'アカウント詳細画面に遷移する' do
        visit new_user_registration_path
        fill_in '名前', with: 'user1'
        fill_in 'Eメール', with: 'user1@sample.com'
        fill_in 'パスワード', with: '111111'
        fill_in 'パスワード（確認用）', with: '111111'
        click_button '登録する'
        expect(page).to have_content 'アカウント詳細'
      end
    end
    context 'ログインせずに仕込み一覧画面に遷移した場合' do
      it 'ログイン画面に遷移し、「ログインもしくはアカウント登録してください。」というメッセージが表示される' do
        visit food_preps_path
        expect(page).to have_content 'ログインもしくはアカウント登録してください。'
      end
    end
  end

  describe 'ログイン機能' do
    let!(:first_user) { FactoryBot.create(:first_user) }
    let!(:second_user) { FactoryBot.create(:second_user) }
    before do
      visit new_user_session_path
      fill_in 'user_email', with: 'user1@sample.com'
      fill_in 'user_password', with: '111111'
      click_button 'ログイン'
    end
    context '登録済みのユーザでログインした場合' do
      it 'アカウント詳細画面に遷移し、「ログインしました。」というメッセージが表示される' do
        expect(page).to have_content 'ログインしました。'
      end
      it '他人の詳細画面にアクセスすると、自分の詳細画面に遷移する' do
        visit user_path(second_user.id)
        expect(page).to have_content 'user1@sample.com'
      end
      it 'ログアウトするとログイン画面に遷移し、「ログアウトしました。」というメッセージが表示される' do
        click_on 'menu_button'
        click_on 'ログアウト'
        expect(page).to have_content 'ログアウトしました。'
      end
    end
  end
end