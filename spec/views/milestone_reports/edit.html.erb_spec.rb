require 'rails_helper'

RSpec.describe "milestone_reports/edit", type: :view do
  before(:each) do
    @milestone_report = assign(:milestone_report, MilestoneReport.create!(
      :milestone_id => "",
      :status_cd => "MyText"
    ))
  end

  it "renders the edit milestone_report form" do
    render

    assert_select "form[action=?][method=?]", milestone_report_path(@milestone_report), "post" do

      assert_select "input[name=?]", "milestone_report[milestone_id]"

      assert_select "textarea[name=?]", "milestone_report[status_cd]"
    end
  end
end
