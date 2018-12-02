require './spec/assistants/batch/daily_batch_assistant'

RSpec.describe Batch::DailyBatch do

  shared_context :daily_batch_context do |test_pattern|
    let (:assistant) { Batch::DailyBatchAssistant.new(test_pattern) }
    subject (:batch) { Batch::DailyBatch.new(config) }
  end

  shared_examples :daily_batch_execute do |makes_the_result_with, test_pattern|
    include_context :batch_context
    include_context :daily_batch_context, test_pattern

    it makes_the_result_with do
      batch.execute(values[:params])
      expect(actual).to eq(values[:expected])
    end
  end

  context '開始2日前のプロジェクトの場合' do
    include_examples :daily_batch_execute, '報告されないこと', :project_before_2days
  end

  context '開始1日前でリリース日が登録されていないプロジェクトの場合' do
    include_examples :daily_batch_execute, '警告ステータスで報告されること', :project_not_scheduled
  end

  context '未完了のマイルストーンがある場合' do
    include_examples :daily_batch_execute, '警告ステータスで報告されること', :milestone_not_completed
  end
end
