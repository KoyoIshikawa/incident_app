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
        it "記事が保存される" do
          expect{ subject }.to change{ Article.count }.by(1)
        end
        it "詳細ページにリダイレクトされる" do
          subject
          expect(response).to redirect_to Incident.find(incident_id)
        end
      end
      context "パラメータが異常なとき" do
        let(:params) { { article: attributes_for(:article, :invalid) } }

        it "詳細ページにリダイレクトされる" do
          subject
          expect(response).to have_http_status(302)
        end
        it "インシデントが保存されない" do
          expect { subject }.not_to change(Article, :count)
        end
      end
    end
    describe "GET #edit" do
      let(:incident) { create(:incident, user: @user)}
      let(:article) {create(:article, incident: incident, user: @user)}
      let(:incident_id) { incident.id }
      let(:article_id) { article.id }
      subject { get(edit_incident_article_path(incident_id,article_id)) }
      context "記事が存在するとき" do
        it "リクエストが成功する" do
          subject
          expect(response).to have_http_status(:ok)
        end
        it "記事が表示される" do
          subject
          expect(response.body).to include article.content
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