require 'rails_helper'

RSpec.describe "milestones/index", type: :view do
  before(:each) do
    assign(:milestones, [
      Milestone.create!(
        :project_id => "",
        :milestone_nm => "MyText"
      ),
      Milestone.create!(
        :project_id => "",
        :milestone_nm => "MyText"
      )
    ])
  end

  it "renders a list of milestones" do
    render
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
