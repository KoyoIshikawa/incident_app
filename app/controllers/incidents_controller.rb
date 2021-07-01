class IncidentsController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :set_incident, only: %i[edit update destroy]

  def index
    @incidents = Incident.order(id: :DESC)
  end

  def show
    @incident = Incident.find(params[:id])
    @articles = @incident.articles
    @article = Article.new
  end

  def new
    @incident = Incident.new
  end

  def create
    incident = current_user.incidents.create!(incident_params)
    redirect_to incident,  notice: "作成しました"
  end

  def edit
  end

  def update
    @incident.update!(incident_params)
    redirect_to @incident, notice: "更新しました"
  end

  def destroy
    @incident.destroy!
    redirect_to root_path, alert: "削除しました"
  end

  private
  def incident_params
    params.require(:incident).permit(:incident, :solution, :os_name_id, :status_id, :coding_lang_id)
  end

  def set_incident
    @incident = current_user.incidents.find_by(id: params[:id])
    redirect_to root_path, alert: "権限がありません" if @incident.nil?
  end
end
