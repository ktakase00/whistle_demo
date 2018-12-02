require 'rails_helper'

RSpec.describe "milestone_reports/new", type: :view do
  before(:each) do
    assign(:milestone_report, MilestoneReport.new(
      :milestone_id => "",
      :status_cd => "MyText"
    ))
  end

  it "renders new milestone_report form" do
    render

    assert_select "form[action=?][method=?]", milestone_reports_path, "post" do

      assert_select "input[name=?]", "milestone_report[milestone_id]"

      assert_select "textarea[name=?]", "milestone_report[status_cd]"
    end
  end
end
