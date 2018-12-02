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

  let (:test_data) do
    file_path = Rails.root.join('spec', 'test_data', 'batch', '02_daily_batch.yml')
    YAML.load_file(file_path).deep_symbolize_keys
  end

  let (:pre_condition) do
    values = test_data[test_pattern]
    writer = TestDataWriter.new(values[:fixtures])
    writer.execute
  end

  let (:execute) do
    pre_condition
    batch.execute({ mode: test_pattern })
    actual
  end

  let (:expected) { test_data[test_pattern][:expected] }

  context '開始2日前のプロジェクトの場合' do
    let (:current_at) { '2018-12-01 00:00:00+09' }
    let (:test_pattern) { :project_before_2days }
    let (:get_actual) { retrieve_project_reports }

    it '報告されないこと' do
      expect(execute).to eq(expected)
    end
  end

  context '開始1日前でリリース日が登録されていないプロジェクトの場合' do
    let (:current_at) { '2018-12-02 00:00:00+09' }
    let (:test_pattern) { :project_not_scheduled }
    let (:get_actual) { retrieve_project_reports }

    it '警告ステータスで報告されること' do
      expect(execute).to eq(expected)
    end
  end

  context '未完了のマイルストーンがある場合' do
    let (:current_at) { '2018-12-05 00:00:00+09' }
    let (:test_pattern) { :milestone_not_completed }
    let (:get_actual) { retrieve_milestone_reports }

    it '警告ステータスで報告されること' do
      expect(execute).to eq(expected)
    end
  end

end
