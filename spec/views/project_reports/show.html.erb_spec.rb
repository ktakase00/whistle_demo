require 'rails_helper'

RSpec.describe "project_reports/show", type: :view do
  before(:each) do
    @project_report = assign(:project_report, ProjectReport.create!(
      :project_id => "",
      :status_cd => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/MyText/)
  end
end
