class BoardsController < ApplicationController
  before_action :set_board, only: %i[ show edit update destroy ]

  # GET /boards or /boards.json
  def index
    @boards = Board.all
  end

  # GET /boards/1 or /boards/1.json
  def show
  end

  # GET /boards/new
  def new
    @board = Board.new
    @users = User.all
    @games = Game.all
    @teams = Team.all
  end

  # GET /boards/1/edit
  def edit
    @board = Board.find(params[:id])
    @users = User.all
    @games = Game.all
    @teams = Team.all
  end

  # POST /boards or /boards.json
  def create
    @board = Board.new(board_params)
    @users = User.all
    @games = Game.all
    @teams = Team.all

    respond_to do |format|      
      unless board_params[:score1].blank? || board_params[:score2].blank?
        UpdateUserPointsJob.perform_now
      end

      if @board.save
        format.html { redirect_to board_url(@board), notice: "Board was successfully created." }
        format.json { render :show, status: :created, location: @board }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @board.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /boards/1 or /boards/1.json
  def update
    respond_to do |format|
      unless board_params[:score1].blank? || board_params[:score2].blank?
        UpdateUserPointsJob.perform_now
      end

      puts board_url(@board)
      if @board.update(board_params)
        format.html { redirect_to board_url(@board), notice: "Board was successfully updated." }
        format.json { render :show, status: :ok, location: @board }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @board.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /boards/1 or /boards/1.json
  def destroy
    @board.destroy

    respond_to do |format|
      format.html { redirect_to boards_url, notice: "Board was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_board
      @board = Board.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def board_params
      params.require(:board).permit(:users_id, :games_id, :score1, :score2)
    end
end
