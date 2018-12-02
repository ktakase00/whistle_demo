require 'rails_helper'

RSpec.describe "project_reports/new", type: :view do
  before(:each) do
    assign(:project_report, ProjectReport.new(
      :project_id => "",
      :status_cd => "MyText"
    ))
  end

  it "renders new project_report form" do
    render

    assert_select "form[action=?][method=?]", project_reports_path, "post" do

      assert_select "input[name=?]", "project_report[project_id]"

      assert_select "textarea[name=?]", "project_report[status_cd]"
    end
  end
end
