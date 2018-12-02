RSpec.describe Batch::DailyBatch do

  let (:config) { AppUtil.load_config }
  subject (:batch) { Batch::DailyBatch.new(config) }

  let (:stub_now) do
    allow(AppUtil).to receive(:get_now) do
      current_at.nil? ? Time.now : Time.parse(current_at)
    end
  end

  let (:actual) do
    get_actual.map { |row| row.serializable_hash(except: :id).symbolize_keys }
  end

  let (:retrieve_project_reports) do
    ProjectReport.joins(:project).select(:project_nm, :status_cd)
  end

  let (:retrieve_milestone_reports) do
    MilestoneReport.joins(:milestone).select(:milestone_nm, :status_cd)
  end

  context '開始2日前のプロジェクトの場合' do
    let (:current_at) { '2018-12-01 00:00:00+09' }
    let (:get_actual) { retrieve_project_reports }

    it '報告されないこと' do
      create(:project, {
        project_nm: 'project1',
        start_at: '2018-12-03 00:00:00+09'
      })
      batch.execute({ mode: :project_before_2days })
      expect(actual).to eq([])
    end
  end

  context '開始1日前でリリース日が登録されていないプロジェクトの場合' do
    let (:current_at) { '2018-12-02 00:00:00+09' }
    let (:get_actual) { retrieve_project_reports }

    it '警告ステータスで報告されること' do
      create(:project, {
        project_nm: 'project1',
        start_at: '2018-12-03 00:00:00+09'
      })
      batch.execute({ mode: :project_not_scheduled })
      expect(actual).to eq([{
        project_nm: 'project1',
        status_cd: 'bad'
      }])
    end
  end

  context '未完了のマイルストーンがある場合' do
    let (:current_at) { '2018-12-05 00:00:00+09' }
    let (:get_actual) { retrieve_milestone_reports }

    it '警告ステータスで報告されること' do
      project = create(:project, {
        project_nm: 'project1',
        start_at: '2018-12-03 00:00:00+09',
        release_at: '2019-01-03 00:00:00+09'
      })
      milestone1 = create(:milestone, {
        project_id: project.id,
        milestone_nm: 'milestone1',
        schedule_at: '2018-12-04 00:00:00+09',
        completed_at: '2018-12-04 00:00:00+09'
      })
      milestone2 = create(:milestone, {
        project_id: project.id,
        milestone_nm: 'milestone2',
        schedule_at: '2018-12-05 00:00:00+09'
      })
      create(:milestone_report, {
        milestone_id: milestone1.id,
        report_at: '2018-12-04 00:00:00+09',
        status_cd: 'good'
      })
      batch.execute({ mode: :milestone_not_completed })
      expect(actual).to eq([{
        milestone_nm: 'milestone1',
        status_cd: 'good'
      }, {
        milestone_nm: 'milestone2',
        status_cd: 'bad'
      }])
    end
  end

end
