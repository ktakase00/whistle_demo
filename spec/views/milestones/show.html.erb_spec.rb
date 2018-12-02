require 'rails_helper'

RSpec.describe "milestones/show", type: :view do
  before(:each) do
    @milestone = assign(:milestone, Milestone.create!(
      :project_id => "",
      :milestone_nm => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/MyText/)
  end
end
