require 'rails_helper'

RSpec.describe "Articles", type: :request do
  describe "ログインしているとき" do
    before do 
      @user = create(:user)
      sign_in @user
    end
    describe "POST #create" do
      let(:incident) { create(:incident, user: @user)}
      let(:incident_id) { incident.id }
      subject { post(incident_articles_path(incident_id), params: params) }

      context "パラメータが正常なとき" do
        let(:params) { { article: attributes_for(:article) } }

        it "リクエストが成功する" do
          subject
          expect(response).to have_http_status(302)
        end
        it "インシデントが保存される" do
          expect{ subject }.to change{ Article.count }.by(1)
        end
        it "詳細ページにリダイレクトされる" do
          subject
          expect(response).to redirect_to Incident.find(incident_id)
        end
      end
      context "パラメータが異常なとき" do
        let(:params) { { incident: attributes_for(:incident, :invalid) } }

        it "リクエストが成功する" do
          subject
          expect(response).to have_http_status(200)
        end
        it "インシデントが保存されない" do
          expect { subject }.not_to change(Incident, :count)
        end
        it "新規投稿ページにレンダリングされる" do 
          subject
          expect(response.body).to include "新規発行"
        end
      end
    end
    describe "GET #edit" do
      # before do
      #   @incident = create(:incident, user: @user)
      #   @articles = create_list(:article, 3, incident: @incident, user: @user)
      # end
      let(:incident) { create(:incident, user: @user)}
      let(:articles) {create_list(:article, 3, incident: incident, user: @user)}
      let(:incident_id) { incident.id }
      subject { get(incident_path(incident_id)) }
      context "インシデントが存在するとき" do
        it "リクエストが成功する" do
          subject
          expect(response).to have_http_status(:ok)
        end

        it "インシデントが表示される" do
          subject
          expect(response.body).to include incident.incident
        end

        it "解決方法がが表示される" do
          subject
          expect(response.body).to include incident.solution
        end
        it "ユーザ名が表示される" do 
          subject
          expect(response.body).to include incident.user.username
        end

        it "作成日時が表示される"do
          subject
          expect(response.body).to include I18n.l incident.created_at, format: :long
          
        end

        it "更新日時が表示される"do
          subject
          expect(response.body).to include I18n.l incident.updated_at, format: :long
        end

        it "ステータスが表示される"do
          subject
          expect(response.body).to include incident.status.status
        end

        it "OSが表示される"do
          subject
          expect(response.body).to include incident.os_name.name
        end

        it "言語が表示される" do
          subject
          expect(response.body).to include incident.coding_lang.name
        end     
      end
      context ":idに対応するインシデントが存在しないとき" do
        let(:incident_id)  { 1 }
        it "エラーが発生する" do
          expect { subject }.to raise_error ActiveRecord::RecordNotFound
        end
      end
    end
    describe "PATCH #update" do
      subject { patch(incident_path(incident.id), params: params) }
      let(:incident){ create(:incident, user: @user)}

      context "パラメータが正常なとき" do
        let(:params) { { incident: attributes_for(:incident, 
                         coding_lang_id: CodingLang.first.id, 
                         os_name_id: OsName.first.id, 
                         status_id: Status.first.id) } }
        
        it "リクエストが成功する" do
          subject
          expect(response).to have_http_status(302)
        end
        it "インシデントが更新される" do
          origin_incident = incident.incident
          new_incident = params[:incident][:incident]
          expect{ subject }.to change { incident.reload.incident }.from(origin_incident).to(new_incident)
        end
        it "解決方法が更新される" do
          origin_solution = incident.solution
          new_solution = params[:incident][:solution]
          expect{ subject }.to change { incident.reload.solution }.from(origin_solution).to(new_solution)
        end
        it "OSが更新される" do
          origin_os_name = incident.os_name_id
          new_os_name = params[:incident][:os_name_id]
          expect{ subject }.to change { incident.reload.os_name_id }.from(origin_os_name).to(new_os_name)
        end
        it "ステータスが更新される" do
          origin_status = incident.status_id
          new_status = params[:incident][:status_id]
          expect{ subject }.to change { incident.reload.status_id }.from(origin_status).to(new_status)
        end
        it "言語が更新される" do
          origin_coding_lang = incident.coding_lang_id
          new_coding_lang = params[:incident][:coding_lang_id]
          expect{ subject }.to change { incident.reload.coding_lang_id }.from(origin_coding_lang).to(new_coding_lang)
        end
        it "詳細ページにリダイレクトされる" do
          subject
          expect(response).to redirect_to Incident.last
        end
      end
      context "パラメータが異常なとき" do
        let(:params) { { incident: attributes_for(:incident, :invalid) } }

        it "リクエストが成功する" do
          subject
          expect(response).to have_http_status(200)
        end
        it "インシデントが更新されない" do
          expect { subject }.not_to change(incident.reload, :incident)
        end
        it "解決方法が更新されない" do
          expect { subject }.not_to change(incident.reload, :solution)
        end
        it "OSが更新されない" do
          expect { subject }.not_to change(incident.reload, :os_name_id)
        end
        it "ステータスが更新されない" do
          expect { subject }.not_to change(incident.reload, :status_id)
        end
        it "言語が更新されない" do
          expect { subject }.not_to change(incident.reload, :coding_lang_id)
        end
        it "新規投稿ページにレンダリングされる" do 
          subject
          expect(response.body).to include "更新"
        end
      end
    end
    describe 'DELETE #destroy' do
      subject { delete(incident_path(incident.id)) }
      let!(:incident) { create(:incident, user: @user) }

      context 'パラメータが正常な場合' do
        it 'リクエストが成功する' do
          subject
          expect(response).to have_http_status(302)
        end

        it 'incidentが削除される' do
          expect { subject }.to change(Incident, :count).by(-1)
        end

        it 'インシデント一覧にリダイレクトすること' do
          subject
          expect(response).to redirect_to(root_path)
        end
      end
    end
  end
end