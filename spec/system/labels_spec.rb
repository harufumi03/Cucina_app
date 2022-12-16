require 'rails_helper'

RSpec.describe 'ラベル管理機能', type: :system do
  let!(:second_user) { FactoryBot.create(:second_user) }
  before do
    driven_by(:selenium_chrome_headless)
    @current_user = User.find_by(email: "user2@sample.com")
    visit new_user_session_path
    fill_in 'user_email', with: 'user2@sample.com'
    fill_in 'user_password', with: '222222'
    click_button 'ログイン'
  end
  describe '登録機能' do
    context 'ラベルを登録した場合' do
      it '登録したラベルが表示される' do
        visit new_label_path
        fill_in 'label_name', with: 'label1'
        click_button '作成する'
        expect(page).to have_content 'label1'
      end
    end
  end
  describe '一覧表示機能' do
    let!(:label) { FactoryBot.create(:label) }
    context '一覧画面に遷移した場合' do
      it '登録済みのラベル一覧が表示される' do
        visit labels_path
        expect(page).to have_content 'test'
      end
    end
  end
end