require 'rails_helper'
describe List do
  before do
    @list = FactoryBot.build(:list)
  end
  describe 'リスト作成' do
    context 'チーム作成がうまくいくとき' do
      it 'list_nameが存在すれば作成できる' do
        expect(@list).to be_valid
      end
      it 'list_nameが20文字以内なら作成できる' do
        @list.list_name = 'abcdefghijklmnopqrst'
        expect(@list).to be_valid
      end
    end
    context 'リスト作成がうまくいかないとき' do
      it 'list_nameが空だと作成できない' do
        @list.list_name = nil
        @list.valid?
        expect(@list.errors.full_messages).to include('リスト名を入力してください')
      end
      it 'list_nameが20文字より多いと作成できない' do
        @list.list_name = 'abcdefghijklmnopqrstu'
        @list.valid?
        expect(@list.errors.full_messages).to include('リスト名は20文字以内で入力してください')
      end
    end
  end
end