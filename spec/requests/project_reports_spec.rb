require 'rails_helper'

RSpec.describe "ProjectReports", type: :request do
  describe "GET /project_reports" do
    it "works! (now write some real specs)" do
      get project_reports_path
      expect(response).to have_http_status(200)
    end
  end
end
