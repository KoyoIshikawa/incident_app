require 'rails_helper'

RSpec.describe User, type: :model do
  describe "バリデーション" do
    subject { user.valid? }
    context "データが条件を満たすとき" do
      let(:user) { build(:user) }
      it "保存できる" do
        expect(subject).to eq true
      end
    end
    context "usernameが空白のとき" do
      let(:user) { build(:user, username: "") }
      it "エラーが発生する" do
        expect(subject).to eq false
        expect(user.errors.messages[:username]).to include "を入力してください"
      end
    end
    context "usernameがすでに存在するとき" do
      before { create(:user, username: "testuser") }
      let(:user) { build(:user, username: "testuser") }
      it "エラーが発生する" do
        expect(subject).to eq false
        expect(user.errors.messages[:username]).to include "はすでに存在します"
      end
    end
    context "usernameが31文字以上のとき" do
      let(:user) { build(:user, username: "a" * 31)}
      it "エラーが発生する" do
        expect(subject).to eq false
        expect(user.errors.messages[:username]).to include "は30文字以内で入力してください"
      end
    end
    context "emailが空白のとき" do
      let(:user) { build(:user, email: "") }
      it "エラーが発生する" do
        expect(subject).to eq false
        expect(user.errors.messages[:email]).to include "を入力してください"
      end
    end
    context "emailがすでに存在するとき" do
      before { create(:user, email: "test@example.com") }
      let(:user) { build(:user, email: "test@example.com")}
      it "エラーが発生する" do
        expect(subject).to eq false
        expect(user.errors.messages[:email]).to include "はすでに存在します"
      end
    end
    context "emailが256文字以上のとき" do
      let(:user) { build(:user, email: "a" * 256) }
      it "エラーが発生する" do
        expect(subject).to eq false
        expect(user.errors.messages[:email]).to include "は255文字以内で入力してください"
      end
    end
    context "アルファベットと英数字飲みのとき" do
      let(:user) { build(:user, email: Faker::Lorem.characters(number: 16)) }
      it "エラーが発生する" do
        expect(subject).to eq false
        expect(user.errors.messages[:email]).to include "は不正な値です"
      end
    end
    context "全角文字でアドレスが設定されているとき" do
      let(:user) { build(:user, email: "ＡＬ@あいうえお") }
      it "エラーが発生する" do
        expect(subject).to eq false
        expect(user.errors.messages[:email]).to include "は不正な値です"
      end
    end
  end
  #エラーが出ているが、原因はfactory_bot_railsで各種データベースインスタンスを作る設定がないため
  context "ユーザーが削除されたとき" do
    subject { user.destroy }
    let(:user) { create(:user) }
    before do
      create_list(:incident, 2, user: user)
      create(:incident)
    end
    it "そのユーザーのメッセージも削除される" do
      expect { subject }.to change { user.incidents.count }.by(-2)
    end
  end
end


