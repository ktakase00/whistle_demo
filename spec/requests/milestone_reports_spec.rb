require 'rails_helper'

RSpec.describe "MilestoneReports", type: :request do
  describe "GET /milestone_reports" do
    it "works! (now write some real specs)" do
      get milestone_reports_path
      expect(response).to have_http_status(200)
    end
  end
end
