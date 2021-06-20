class IncidentsController < ApplicationController
  before_action :authenticate_user!, except: :index
  def index
    @incidents = Incident.order(id: :DESC)
  end

  def show
    @incident = Incident.find(params[:id])
  end

  def new
    @incident = Incident.new
  end

  def create
    incident = current_user.incidents.create!(incident_params)
    redirect_to incident,  notice: "作成しました"
  end

  def edit
    @incident = current_user.incidents.find(params[:id])
  end

  def update
    incident = Incident.find(params[:id])
    incident.update!(incident_params)
    redirect_to incident, notice: "更新しました"
  end

  def destroy
    incident = Incident.find(params[:id])
    incident.destroy!
    redirect_to root_path, alert: "削除しました"
  end

  private
  def incident_params
    params.require(:incident).permit(:incident, :solution)
  end
end
