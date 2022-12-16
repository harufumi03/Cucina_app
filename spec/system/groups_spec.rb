require 'rails_helper'

RSpec.describe "Groups", type: :system do
  let!(:first_user) { FactoryBot.create(:first_user) }
  let!(:second_user) { FactoryBot.create(:second_user) }
  before do
    driven_by(:selenium_chrome_headless)
  end
  describe 'グループ管理機能' do
    before do
      visit new_user_session_path
      fill_in 'user_email', with: 'user1@sample.com'
      fill_in 'user_password', with: '111111'
      click_button 'ログイン'
      @group = Group.create(name: 'test_group', owner_id: first_user.id)
    end
    context 'グループを作成した場合' do
      it 'グループ詳細画面に遷移する' do
        visit new_group_path
        fill_in 'group_name', with: 'group1'
        click_button '作成する'
        expect(page).to have_content 'グループ詳細'
      end
    end
    context 'グループオーナーでログインした場合' do
      it 'グループを編集できる' do
        visit group_path(@group.id)
        click_on 'edit_group'
        fill_in 'group_name', with: 'test_group_edit'
        click_button '編集する'
        expect(page).to have_content 'グループを編集しました'
      end  
      it 'グループを削除できる' do
        visit group_path(@group.id)
        click_on 'グループを削除'
        expect(page.accept_confirm).to eq '削除しますか？'
        expect(page).to have_content 'グループを削除しました'
      end
      it 'メンバーを招待できる' do
        visit group_path(@group.id)
        fill_in 'post_email', with: "user2@sample.com"
        click_on '招待する'
        expect(page).to have_content '招待に成功しました'
      end  
    end
    context 'グループメンバーでログインした場合' do
      it 'グループを退出できる' do
        visit group_path(@group.id)
        fill_in 'post_email', with: "user2@sample.com"
        click_on '招待する'
        click_on 'menu_button'
        click_on 'ログアウト'
        visit new_user_session_path
        fill_in 'user_email', with: 'user2@sample.com'
        fill_in 'user_password', with: '222222'
        click_button 'ログイン'
        visit group_path(@group.id)
        click_on 'グループから退出'
        expect(page.accept_confirm).to eq 'グループから退出しますか？'
        expect(page).to have_content 'グループから退出しました'
      end
    end
    


  end  
end
