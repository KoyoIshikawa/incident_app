class IncidentsController < ApplicationController
  before_action :authenticate_user!, except: :index
  def index
    @incidents = Incident.order(id: :arc)
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
  end

  def update
  end

  def destroy
  end

  private
  def incident_params
    params.require(:incident).permit(:incident, :solution)
  end
end
