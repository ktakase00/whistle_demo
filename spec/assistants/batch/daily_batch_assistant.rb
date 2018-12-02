module Batch
  class DailyBatchAssistant

    def initialize(test_pattern)
      @test_pattern = test_pattern
      @test_data = load_test_data
    end

    def load_test_data
      file_path = Rails.root.join('spec', 'test_data', 'batch', '03_daily_batch.yml')
      YAML.load_file(file_path).deep_symbolize_keys
    end

    def pre_condition
      values = get_values
      writer = TestDataWriter.new(values[:fixtures])
      writer.execute
    end

    def get_values
      @test_data[@test_pattern]
    end

    def get_actual
      rows = case @test_pattern
      when :project_before_2days, :project_not_scheduled
        ProjectReport.joins(:project).select(:project_nm, :status_cd)

      when :milestone_not_completed
        MilestoneReport.joins(:milestone).select(:milestone_nm, :status_cd)
      end

      rows.map { |row| row.serializable_hash(except: :id).symbolize_keys }
    end

  end
end
