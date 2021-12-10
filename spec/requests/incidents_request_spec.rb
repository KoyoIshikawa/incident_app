require 'rails_helper'

RSpec.describe "Incidents", type: :request do
  describe "GET #index" do
    subject { get(incidents_path) }
    context "インシデントが存在するとき" do 
      before { create_list(:incident, 3) }
      it "リクエストが成功する" do
        subject
        expect(response).to have_http_status(:ok)
      end

      it "incident が表示されている" do
        subject
        expect(response.body).to include(*Incident.pluck(:incident))
      end
    end
  end
end