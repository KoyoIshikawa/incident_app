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
    incident = Incident.create!(incident_params)
    redirect_to incident
  end

  def edit
    @incident = Incident.find(params[:id])
  end

  def update
    incident = Incident.find(params[:id])
    incident.update!(incident_params)
    redirect_to incident
  end

  def destroy
    incident = Incident.find(params[:id])
    incident.destroy!
    redirect_to root_path
  end

  private
  def incident_params
    params.require(:incident).permit(:incident, :solution)
  end
end
