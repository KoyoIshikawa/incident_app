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
      it "エラーが発生する" do
        # テスト
      end
    end
    context "emailが空白のとき" do
      it "エラーが発生する" do
        # テスト
      end
    end
    context "emailがすでに存在するとき" do
      it "エラーが発生する" do
        # テスト
      end
    end
    context "emailが256文字以上のとき" do
      it "エラーが発生する" do
        # テスト
      end
    end
    context "アルファベットと英数字飲みのとき" do
      it "エラーが発生する" do
        # テスト
      end
    end
  end
  context "ユーザが削除されたとき" do
    it "そのユーザのインシデントを削除する" do
      # テスト
    end
  end
end


