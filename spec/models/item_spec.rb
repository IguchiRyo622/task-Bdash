require 'rails_helper'
RSpec.describe Item, type: :model do
  describe 'タスクへのタスク項目投稿' do
    before do
      @item = FactoryBot.build(:item)
    end

    context '投稿ができるとき' do
      it '必要な情報が存在するとき' do
        expect(@item).to be_valid
      end
      it 'タスク項目に最初からチェックを入れ、trueにしても投稿できる' do
        @item.check = true
        expect(@item).to be_valid
      end
    end
    context '投稿ができないとき' do
      it '項目名が空だとコメントできない' do
        @item.task_item = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Task itemを入力してください')
      end
      it 'user_idが空だとコメントできない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Userを入力してください')
      end
      it 'task_idが空だとコメントできない' do
        @item.task = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Taskを入力してください')
      end
    end
  end
end
