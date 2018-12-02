require 'rails_helper'

RSpec.describe "milestones/new", type: :view do
  before(:each) do
    assign(:milestone, Milestone.new(
      :project_id => "",
      :milestone_nm => "MyText"
    ))
  end

  it "renders new milestone form" do
    render

    assert_select "form[action=?][method=?]", milestones_path, "post" do

      assert_select "input[name=?]", "milestone[project_id]"

      assert_select "textarea[name=?]", "milestone[milestone_nm]"
    end
  end
end
