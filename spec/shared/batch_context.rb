RSpec.shared_context :batch_context do
  let (:config) { AppUtil.load_config }
  let (:values) { assistant.get_values }
  let (:current_at) { values[:current_at] }
  let (:actual) { assistant.get_actual }

  let (:stub_now) do
    allow(AppUtil).to receive(:get_now) do
      current_at.nil? ? Time.now : Time.parse(current_at)
    end
  end

  before (:each) do
    assistant.pre_condition
    stub_now
  end
end
