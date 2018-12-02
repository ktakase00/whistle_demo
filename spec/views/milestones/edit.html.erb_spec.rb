require 'rails_helper'

RSpec.describe "milestones/edit", type: :view do
  before(:each) do
    @milestone = assign(:milestone, Milestone.create!(
      :project_id => "",
      :milestone_nm => "MyText"
    ))
  end

  it "renders the edit milestone form" do
    render

    assert_select "form[action=?][method=?]", milestone_path(@milestone), "post" do

      assert_select "input[name=?]", "milestone[project_id]"

      assert_select "textarea[name=?]", "milestone[milestone_nm]"
    end
  end
end
