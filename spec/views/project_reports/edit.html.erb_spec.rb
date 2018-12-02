require 'rails_helper'

RSpec.describe "project_reports/edit", type: :view do
  before(:each) do
    @project_report = assign(:project_report, ProjectReport.create!(
      :project_id => "",
      :status_cd => "MyText"
    ))
  end

  it "renders the edit project_report form" do
    render

    assert_select "form[action=?][method=?]", project_report_path(@project_report), "post" do

      assert_select "input[name=?]", "project_report[project_id]"

      assert_select "textarea[name=?]", "project_report[status_cd]"
    end
  end
end
