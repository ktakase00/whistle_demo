require 'rails_helper'

RSpec.describe "project_reports/index", type: :view do
  before(:each) do
    assign(:project_reports, [
      ProjectReport.create!(
        :project_id => "",
        :status_cd => "MyText"
      ),
      ProjectReport.create!(
        :project_id => "",
        :status_cd => "MyText"
      )
    ])
  end

  it "renders a list of project_reports" do
    render
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
