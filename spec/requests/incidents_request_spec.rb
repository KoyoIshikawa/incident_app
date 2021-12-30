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
  describe "GET #show" do
    before do
      @user = create(:user)
      @incident = create(:incident, user: @user)
      @article = create(:article, incident: @incident, user: @user)
    end
    subject { get(incident_path(@article.incident_id)) }
    context "インシデントが存在するとき" do
      before do
        sign_in @user
      end
      it "リクエストが成功する" do
        subject
        expect(response).to have_http_status(:ok)
      end

      it "インシデントが表示される" do
        incident = create(:incident)
        expect(response.body).to include incident.incident
      end

      it "解決方法がが表示される" do
        incident = create(:incident)
        expect(response.body).to include incident.solution
      end
      it "ユーザ名が表示される" do 
        incident = create(:incident)
        expect(response.body).to include incident.users.username
      end

      it "作成日時が表示される"do
        incident = create(:incident)
        expect(response.body).to include incident.create_at
      end

      it "更新日時が表示される"do
        incident = create(:incident)
        expect(response.body).to include incident.update_at
      end

      it "ステータスが表示される"do
        incident = create(:incident)
        expect(response.body).to include incident.status
      end

      it "OSが表示される"do
        incident = create(:incident)
        expect(response.body).to include incident.os_name
      end

      it "言語が表示される" do
        incident = create(:incident)
        expect(response.body).to include incident.coding_lang
      end

      context "インシデントに付随する記事が存在するとき" do
        it "記事一覧が表示される" do 

        end
      end
      context "インシデントに付随する記事が存在しないとき" do
        it "記事一覧が表示される" do 
          
        end 
      end
      
    end
    context ":idに対応するインシデントが存在しないとき" do
      it "エラーが発生する" do
        
      end
    end
  end
  describe "GET #new" do
    it "リクエストが成功する" do
      
    end
  end 
  describe "POST #create" do
    context "パラメータが正常なとき" do
      it "インシデントが保存される" do
        
      end
      it "詳細ページにリダイレクトされる" do
        
      end
    end
    context "パラメータが異常なとき" do
      it "リクエストが成功する" do
        
      end
      it "インシデントが保存されない" do
        
      end
      it "新規投稿ページにレンダリングされる" do 

      end
    end
  end
  describe "GET #edit" do
    context "インシデントが存在するとき" do 
      it "リクエストが成功する" do
      end

      it "インシデントが表示されている" do
      end

      it "解決方法がが表示される" do

      end
      it "ユーザが表示される" do 

      end

      it "作成日時が表示される"do
      
      end

      it "更新日時が表示される"do
      
      end

      it "ステータスが表示される"do

      end

      it "OSが表示される"do
      
      end

      it "言語が表示される" do
        
      end

      context "インシデントに付随する記事が存在するとき" do
        it "記事一覧が表示される" do 

        end
      end
      context "インシデントに付随する記事が存在しないとき" do
        it "記事一覧が表示される" do 
          
        end 
      end
      
    end
    context ":idに対応するインシデントが存在しないとき" do
      it "エラーが発生する" do
        
      end
    end
  end
  describe "PATCH #update" do
    context "パラメータが正常なとき" do
      it "リクエストが成功する" do
      end

      it "インシデントが更新される" do

      end

      it "解決方法が更新される" do

      end
      it "更新日時が更新される"do
      
      end

      it "ステータスが更新される"do

      end

      it "OSが更新される"do
      
      end

      it "言語が更新される" do
        
      end
      it "詳細ページにリダイレクトされる" do
        
      end
    end
    context "インシデントのパラメータが異常なとき" do
      it "リクエストが成功する" do
        
      end
      it "インシデントが更新されない" do
        
      end
      it "解決方法が更新されない" do

      end
      it "更新日時が更新されない"do
      
      end

      it "ステータスが更新されない"do

      end

      it "OSが更新されない"do
      
      end

      it "言語が更新されない" do
        
      end
      it "編集ページにレンダリングされる" do
        
      end
    end
  end
end