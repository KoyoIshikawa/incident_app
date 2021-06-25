class ArticlesController < ApplicationController
  def create
    article = current_user.articles.create!(content: article_params[:content], incident_id: params[:incident_id])
    redirect_to "/incidents/#{article.incident.id}",  notice: "作成しました"
  end

  def edit 
    @incident = Incident.find(params[:id])
    @article = Article.find(params[:id])
  end

  def update

  end
  
  def destroy
  end

  private
  def article_params
    params.require(:article).permit(:content)
  end
end
