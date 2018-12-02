FactoryBot.define do
  factory :milestone do
    project_id { "" }
    milestone_nm { "MyText" }
    schedule_at { "2018-12-02 17:42:54" }
    completed_at { "2018-12-02 17:42:54" }
  end
end
