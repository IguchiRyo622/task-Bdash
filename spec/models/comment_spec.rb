require 'rails_helper'
RSpec.describe Comment, type: :model do
  describe 'タスクへのコメントを投稿' do
    before do
      @comment = FactoryBot.build(:comment)
    end

    context 'コメントができるとき' do
      it '必要な情報が存在するとき' do
        expect(@comment).to be_valid
      end
    end
    context 'コメントができないとき' do
      it 'コメント内容が空だとコメントできない' do
        @comment.comment = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include('Commentを入力してください')
      end
      it 'user_idが空だとコメントできない' do
        @comment.user = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include('Userを入力してください')
      end
      it 'task_idが空だとコメントできない' do
        @comment.task = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include('Taskを入力してください')
      end
    end
  end
end
