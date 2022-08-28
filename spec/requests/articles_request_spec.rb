require 'rails_helper'

RSpec.describe "Articles", type: :request do
  describe "ログインしているとき" do
    before do 
      @user = create(:user)
      sign_in @user
    end
    describe "POST #create" do
      let(:incident) { create(:incident, user: @user)}
      subject { post(incident_articles_path(incident.id), params: params) }

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
          expect(response).to redirect_to Incident.find(incident.id)
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
      let(:article_id) { article.id }
      subject { get(edit_incident_article_path(incident.id,article_id)) }
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
      context ":idに対応する記事が存在しないとき" do
        let(:article_id) { 1 }

        it "一覧画面にリダイレクトされる" do
          expect(subject).to redirect_to(root_path)
        end
      end
    end
    describe "PATCH #update" do
      let(:incident) { create(:incident, user: @user)}
      let(:article) {create(:article, incident: incident, user: @user)}
      subject { patch(incident_article_path(incident.id,article.id), params: params) }

      context "パラメータが正常なとき" do
        let(:params) { { article: attributes_for(:article) } }
        
        it "リクエストが成功する" do
          subject
          expect(response).to have_http_status(302)
        end
        it "contentが更新される" do
          origin_article = article.content
          new_article = params[:article][:content]
          expect{ subject }.to change { article.reload.content }.from(origin_article).to(new_article)
        end
        it "詳細ページにリダイレクトされる" do
          subject
          expect(response).to redirect_to Incident.find(incident.id)
        end
      end
      context "パラメータが異常なとき" do
        let(:params) { { article: attributes_for(:article, :invalid) } }

        it "リクエストが成功する" do
          subject
          expect(response).to have_http_status(200)
        end
        it "contentが更新されない" do
          expect { subject }.not_to change(article.reload, :content)
        end
        it "更新ページにレンダリングされる" do 
          subject
          expect(response.body).to include "更新"
        end
      end
    end
    describe 'DELETE #destroy' do
      subject { delete(incident_article_path(incident.id,article.id)) }
      let!(:incident) { create(:incident, user: @user) }
      let!(:article) {create(:article, incident: incident, user: @user)}

      context 'パラメータが正常な場合' do
        it 'リクエストが成功する' do
          subject
          expect(response).to have_http_status(302)
        end

        it 'articleが削除される' do
          expect { subject }.to change(Article, :count).by(-1)
        end

        it 'インシデント一覧にリダイレクトすること' do
          subject
          expect(response).to redirect_to(incident_path(incident.id))
        end
      end
    end
  end
end