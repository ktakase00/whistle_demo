json.extract! project_report, :id, :project_id, :report_at, :status_cd, :created_at, :updated_at
json.url project_report_url(project_report, format: :json)
