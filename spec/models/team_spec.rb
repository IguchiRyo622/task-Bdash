require 'rails_helper'
describe Team do
  before do
    @team = FactoryBot.build(:team)
  end
  describe 'チーム作成' do
    context 'チーム作成がうまくいくとき' do
      it 'team_nameが存在すれば作成できる' do
        expect(@team).to be_valid
      end
    end
    context 'チーム作成がうまくいかないとき' do
      it 'team_nameが空だと作成できない' do
        @team.team_name = nil
        @team.valid?
        expect(@team.errors.full_messages).to include('チーム名を入力してください')
      end
    end
  end
end
