require 'rails_helper'

RSpec.describe Incident, type: :model do
  describe "バリデーション" do
    subject { incident.valid? }
    context "データが条件を満たすとき" do
      let(:incident) { build(:incident) }
      it "保存できる" do
        expect(subject).to eq true
      end
    end
    context "incidentが空白のとき" do
      let(:incident) { build(:incident, incident: "") }
      it "エラーが発生する" do
        expect(subject).to eq false
        expect(incident.errors.messages[:incident]).to include "を入力してください"
      end
    end
    context "incidentが201文字以上のとき" do
      let(:incident) { build(:incident, incident: "a" * 201)}
      it "エラーが発生する" do
        expect(subject).to eq false
        expect(incident.errors.messages[:incident]).to include "は200文字以内で入力してください"
      end
    end
    context "solutionが空白のとき" do
      let(:incident) { build(:incident, solution: "") }
      it "エラーが発生する" do
        expect(subject).to eq false
        expect(incident.errors.messages[:solution]).to include "を入力してください"
      end
    end
    context "solutionが20001文字以上のとき" do
      let(:incident) { build(:incident, solution: "a" * 20001) }
      it "エラーが発生する" do
        expect(subject).to eq false
        expect(incident.errors.messages[:solution]).to include "は20000文字以内で入力してください"
      end
    end
    # binding.pry
    context "os_nameが空白のとき" do
      let(:incident) { build(:incident, os_name_id: 0) }
      it "エラーが発生する" do
        expect(subject).to eq false
        expect(incident.errors.messages[:os_name]).to include "を入力してください"
      end
    end
    context "statusが空白のとき" do
      let(:incident) { build(:incident, status_id: 0) }
      it "エラーが発生する" do
        expect(subject).to eq false
        expect(incident.errors.messages[:status]).to include "を入力してください"
      end
    end
    context "coding_langが空白のとき" do
      let(:incident) { build(:incident, coding_lang_id: 0) }
      it "エラーが発生する" do
        expect(subject).to eq false
        expect(incident.errors.messages[:coding_lang]).to include "を入力してください"
      end
    end
binding.pry

  end
  context "インシデントが削除されたとき" do
    subject { incident.destroy }
    let(:incident) { create(:incident) }
    before do
      create_list(:incident, 2, incident: incident)
      create(:incident)
    end
    it "インシデント内の記事も削除される" do
      expect { subject }.to change { incident.incidents.count }.by(-2)
    end
  end
end


