require 'rails_helper'

RSpec.describe "Incidents", type: :request do
  describe "GET #index" do
    it "リクエストが成功する" do
      create_list(:incident, 3)
      get(incidents_path)      
      expect(response).to have_http_status(:ok)
    end
  end
end