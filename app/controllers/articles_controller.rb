class ArticlesController < ApplicationController
  before_action :set_article, only: %i[edit update destroy]

  def create
    @article = current_user.articles.new(content: article_params[:content], incident_id: params[:incident_id])
    if @article.save
      redirect_to "/incidents/#{@article.incident.id}", notice: "作成しました"
    else
      redirect_to "/incidents/#{@article.incident.id}", alert: "記事を入力してください"
    end
  end

  def edit 
    
  end

  def update
    @article.update!(article_params)
    redirect_to @incident, notice: "更新しました"
  end

  def destroy
    @article.destroy!
    redirect_to @incident, alert: "削除しました"
  end

  private
  def article_params
    params.require(:article).permit(:content)
  end

  def set_article
    @incident = Incident.find(params[:incident_id])
    @article = current_user.articles.find_by(id: params[:id])
    redirect_to root_path, alert: "権限がありません" if @article.nil?
  end
end
