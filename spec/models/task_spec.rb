require 'rails_helper'
describe Task do
  before do
    @task = FactoryBot.build(:task)
  end
  describe 'タスク作成' do
    context 'タスク作成がうまくいくとき' do
      it 'task_name,content,target_date,task_itemが存在すれば作成できる' do
        expect(@task).to be_valid
      end
      it 'task_name以外空でも作成できる' do
        @task.content = nil
        @task.target_date = nil
        @task.task_item = nil
        expect(@task).to be_valid
      end
    end
    context 'タスク作成がうまくいかないとき' do
      it 'task_nameが空だと作成できない' do
        @task.task_name = nil
        @task.valid?
        expect(@task.errors.full_messages).to include('タスク名を入力してください')
      end
    end
  end
end