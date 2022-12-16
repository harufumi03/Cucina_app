require 'rails_helper'

RSpec.describe 'タスクモデル機能', type: :model do
  let!(:second_user) { FactoryBot.create(:second_user) }
  before do
    @current_user = User.find_by(email: "user2@sample.com")
  end
  describe 'バリデーションのテスト' do
    context 'タスクのタイトルが空文字の場合' do
      it 'バリデーションに失敗する' do
        task = Task.create(title: '', content: '企画書を作成する。', user_id: @current_user.id)
        expect(task).not_to be_valid
      end
    end

    context 'タスクの説明が空文字の場合' do
      it 'バリデーションに失敗する' do
        task = Task.create(title: '企画', content: '', user_id: @current_user.id)
        expect(task).not_to be_valid
      end
    end

    context 'タスクのタイトルと説明に値が入っている場合' do
      it 'タスクを登録できる' do
        task = Task.create(title: '企画', content: '企画書を作成する。', created_at: '2022-11-01', deadline_on: '2025-11-01', priority: '高', status: '着手中', user_id: @current_user.id)
        expect(task).to be_valid
      end
    end
  end

  describe '検索機能' do
    let!(:first_task) { FactoryBot.create(:task, title: 'first_task', user_id: @current_user.id) }
    let!(:second_task) { FactoryBot.create(:second_task, title: 'second_task', user_id: @current_user.id) }
    let!(:third_task) { FactoryBot.create(:third_task, title: 'third_task', user_id: @current_user.id) }
    context 'scopeメソッドでタイトルのあいまい検索をした場合' do
      it "検索ワードを含むタスクが絞り込まれる" do
        # タイトルの検索メソッドをseach_titleとしてscopeで定義した場合のコード例
        # scopeを使って定義した検索メソッドに検索ワードを挿入する
        # toとnot_toのマッチャを使って検索されたものとされなかったものの両方を確認する
        # 検索されたテストデータの数を確認する
        expect(Task.title('first')).to include(first_task)
        expect(Task.title('first')).not_to include(second_task)
        expect(Task.title('first')).not_to include(third_task)
        expect(Task.title('first').count).to eq 1
      end
    end
    context 'scopeメソッドでステータス検索をした場合' do
      it "ステータスに完全一致するタスクが絞り込まれる" do
        # toとnot_toのマッチャを使って検索されたものとされなかったものの両方を確認する
        # 検索されたテストデータの数を確認する
        expect(Task.status('未着手')).to include(first_task)
        expect(Task.status('未着手')).not_to include(second_task)
        expect(Task.status('未着手')).not_to include(third_task)
        expect(Task.status('未着手').count).to eq 1
      end
    end
    context 'scopeメソッドでタイトルのあいまい検索とステータス検索をした場合' do
      it "検索ワードをタイトルに含み、かつステータスに完全一致するタスク絞り込まれる" do
        # toとnot_toのマッチャを使って検索されたものとされなかったものの両方を確認する
        # 検索されたテストデータの数を確認する
        expect(Task.title_status('first', '未着手')).to include(first_task)
        expect(Task.title_status('first', '未着手')).not_to include(second_task)
        expect(Task.title_status('first', '未着手')).not_to include(third_task)
        expect(Task.title_status('first', '未着手').count).to eq 1
      end
    end
  end
end