require 'rails_helper'

RSpec.describe "Incidents", type: :request do
  describe "GET #index" do
    it "リクエストが成功する" do
      create_list(:incident, 3)
      get(incidents_path)      
      expect(response).to have_http_status(:ok)
    end
    it "incident が表示されている" do
      incident1 = create(:incident)
      incident2 = create(:incident)
      incident3 = create(:incident)
      get(incidents_path)
      expect(response.body).to include(incident1.incident, incident2.incident, incident3.incident)
    end
  end
end