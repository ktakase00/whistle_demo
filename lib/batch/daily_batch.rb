module Batch
  class DailyBatch
    def initialize(config)
      @config = config
    end

    def execute(params)
      # ここには本来バッチ処理の内容を書くが、
      # とりえあえずspecを実行したいだけなので、ダミーのコードを書いておく。
      case params[:mode].to_sym
      when :project_not_scheduled
        project = Project.first
        project_report = ProjectReport.new({
          project_id: project.id,
          report_at: AppUtil.get_now,
          status_cd: 'bad'
        })
        project_report.save

      when :milestone_not_completed
        project = Project.first
        milestone = project.milestones.order(:id).last
        milestone_report = MilestoneReport.new({
          milestone_id: milestone.id,
          report_at: AppUtil.get_now,
          status_cd: 'bad'
        })
        milestone_report.save
      end
    end

  end
end
