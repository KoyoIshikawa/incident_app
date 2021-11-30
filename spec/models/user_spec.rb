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
  context "ユーザが削除されたとき" do
    it "そのユーザのインシデントを削除する" do
      # テスト
    end
  end
end


