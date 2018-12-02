class ProjectReportsController < ApplicationController
  before_action :set_project_report, only: [:show, :edit, :update, :destroy]

  # GET /project_reports
  # GET /project_reports.json
  def index
    @project_reports = ProjectReport.all
  end

  # GET /project_reports/1
  # GET /project_reports/1.json
  def show
  end

  # GET /project_reports/new
  def new
    @project_report = ProjectReport.new
  end

  # GET /project_reports/1/edit
  def edit
  end

  # POST /project_reports
  # POST /project_reports.json
  def create
    @project_report = ProjectReport.new(project_report_params)

    respond_to do |format|
      if @project_report.save
        format.html { redirect_to @project_report, notice: 'Project report was successfully created.' }
        format.json { render :show, status: :created, location: @project_report }
      else
        format.html { render :new }
        format.json { render json: @project_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /project_reports/1
  # PATCH/PUT /project_reports/1.json
  def update
    respond_to do |format|
      if @project_report.update(project_report_params)
        format.html { redirect_to @project_report, notice: 'Project report was successfully updated.' }
        format.json { render :show, status: :ok, location: @project_report }
      else
        format.html { render :edit }
        format.json { render json: @project_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /project_reports/1
  # DELETE /project_reports/1.json
  def destroy
    @project_report.destroy
    respond_to do |format|
      format.html { redirect_to project_reports_url, notice: 'Project report was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project_report
      @project_report = ProjectReport.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_report_params
      params.require(:project_report).permit(:project_id, :report_at, :status_cd)
    end
end
