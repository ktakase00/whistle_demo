json.extract! milestone_report, :id, :milestone_id, :report_at, :status_cd, :created_at, :updated_at
json.url milestone_report_url(milestone_report, format: :json)
