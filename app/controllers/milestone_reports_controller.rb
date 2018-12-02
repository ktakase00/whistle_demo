class MilestoneReportsController < ApplicationController
  before_action :set_milestone_report, only: [:show, :edit, :update, :destroy]

  # GET /milestone_reports
  # GET /milestone_reports.json
  def index
    @milestone_reports = MilestoneReport.all
  end

  # GET /milestone_reports/1
  # GET /milestone_reports/1.json
  def show
  end

  # GET /milestone_reports/new
  def new
    @milestone_report = MilestoneReport.new
  end

  # GET /milestone_reports/1/edit
  def edit
  end

  # POST /milestone_reports
  # POST /milestone_reports.json
  def create
    @milestone_report = MilestoneReport.new(milestone_report_params)

    respond_to do |format|
      if @milestone_report.save
        format.html { redirect_to @milestone_report, notice: 'Milestone report was successfully created.' }
        format.json { render :show, status: :created, location: @milestone_report }
      else
        format.html { render :new }
        format.json { render json: @milestone_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /milestone_reports/1
  # PATCH/PUT /milestone_reports/1.json
  def update
    respond_to do |format|
      if @milestone_report.update(milestone_report_params)
        format.html { redirect_to @milestone_report, notice: 'Milestone report was successfully updated.' }
        format.json { render :show, status: :ok, location: @milestone_report }
      else
        format.html { render :edit }
        format.json { render json: @milestone_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /milestone_reports/1
  # DELETE /milestone_reports/1.json
  def destroy
    @milestone_report.destroy
    respond_to do |format|
      format.html { redirect_to milestone_reports_url, notice: 'Milestone report was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_milestone_report
      @milestone_report = MilestoneReport.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def milestone_report_params
      params.require(:milestone_report).permit(:milestone_id, :report_at, :status_cd)
    end
end
