class Api::TeamsController < Api::ApplicationController
  before_action :set_team, only: %i[ show edit update destroy ]

  # GET /teams or /teams.json
  def index
    @teams = Team.all
    
    respond_to do |format|
      format.json { render json: @teams }
      format.xml { render xml: @teams }
    end
  end

  # GET /teams/1 or /teams/1.json
  def show
    @team = Team.find(params[:id])

    respond_to do |format|
      format.json { render json: @team }
      format.xml { render xml: @team }
    end
  end

  # GET /teams/new
  def new
    @team = Team.new

    respond_to do |format|
      format.json { render json: @team }
      format.xml { render xml: @team }
    end
  end

  # GET /teams/1/edit
  def edit
  end

  # POST /teams or /teams.json
  def create
    @team = Team.new(team_params)

    respond_to do |format|
      if @team.save
        format.json { render :json => {:message => "Team created successfully"}, :status => 200 }
        format.xml { render :xml => {:message => "Team created successfully"}, :status => 200 }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /teams/1 or /teams/1.json
  def update
    respond_to do |format|
      if @team.update(team_params)
        format.json { render :json => {:message => "Team updated successfully"}, :status => 200 }
        format.xml { render :xml => {:message => "Team updated successfully"}, :status => 200 }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teams/1 or /teams/1.json
  def destroy
    @team.destroy

    respond_to do |format|
      format.json { render :json => {:message => "Team deleted successfully"}, :status => 200 }
      format.xml { render :xml => {:message => "Team deleted successfully"}, :status => 200 }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team
      @team = Team.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def team_params
      params.require(:team).permit(:name, :logo)
    end
end
