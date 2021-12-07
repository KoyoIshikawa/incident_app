require 'rails_helper'

RSpec.describe Article, type: :model do
  describe "バリデーション" do
    subject { article.valid? }
    context "データが条件を満たすとき" do
      let(:article) { build(:article) }
      it "保存できる" do
        expect(subject).to eq true
      end
    end
    context "contentが空白のとき" do
      let(:article) { build(:article, content: "") }
      it "エラーが発生する" do
        expect(subject).to eq false
        expect(article.errors.messages[:content]).to include "を入力してください"
      end
    end
    context "contentが2001文字以上のとき" do
      let(:article) { build(:article, content: "a" * 2001)}
      it "エラーが発生する" do
        expect(subject).to eq false
        expect(article.errors.messages[:content]).to include "は2000文字以内で入力してください"
      end
    end
  end
end


