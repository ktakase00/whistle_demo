require 'rails_helper'

RSpec.describe "milestone_reports/index", type: :view do
  before(:each) do
    assign(:milestone_reports, [
      MilestoneReport.create!(
        :milestone_id => "",
        :status_cd => "MyText"
      ),
      MilestoneReport.create!(
        :milestone_id => "",
        :status_cd => "MyText"
      )
    ])
  end

  it "renders a list of milestone_reports" do
    render
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
