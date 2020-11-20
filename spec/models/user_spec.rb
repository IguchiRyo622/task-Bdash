require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it 'nicknameとuser_name、email、passwordとpassword_confirmationが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordが英数字混合で6文字以上で登録できる' do
        @user.password = 'japan2020'
        @user.password_confirmation = 'japan2020'
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('ニックネームを入力してください')
      end
      it 'user_nameが空だと登録できない' do
        @user.user_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('ユーザーidを入力してください')
      end
      it 'user_nameがアルファベットだけだと登録できない' do
        @user.user_name = 'Name'
        @user.valid?
        expect(@user.errors.full_messages).to include('ユーザーidは英数字混合で入力してください')
      end
      it 'user_nameが数字だけだと登録できない' do
        @user.user_name = '123'
        @user.valid?
        expect(@user.errors.full_messages).to include('ユーザーidは英数字混合で入力してください')
      end
      it 'emailが空だと登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールを入力してください')
      end
      it 'emailに@が含まれないと登録できない' do
        @user.email = 'testgmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールは不正な値です')
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        anuther_user = FactoryBot.build(:user)
        anuther_user.email = @user.email
        anuther_user.valid?
        expect(anuther_user.errors.full_messages).to include('Eメールはすでに存在します')
      end
      it 'passwordが空だと登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードを入力してください')
      end
      it 'passwordがアルファベットのみは登録できない' do
        @user.password = 'japanx'
        @user.password_confirmation = 'japanx'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは英数字混合で入力してください')
      end
      it 'passwordが数字のみは登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは英数字混合で入力してください')
      end
      it 'passwordが５文字以下では登録できない' do
        @user.password = 'abc12'
        @user.password_confirmation = 'abc12'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワード（確認用）とパスワードの入力が一致しません')
      end
      it 'passwordとpassword_confirmationの値が異なる' do
        @user.password = 'abc123'
        @user.password_confirmation = 'abx123'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワード（確認用）とパスワードの入力が一致しません')
      end
    end
  end
end