require 'rails_helper'

RSpec.describe "milestone_reports/show", type: :view do
  before(:each) do
    @milestone_report = assign(:milestone_report, MilestoneReport.create!(
      :milestone_id => "",
      :status_cd => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/MyText/)
  end
end
