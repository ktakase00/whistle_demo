require "rails_helper"

RSpec.describe MilestoneReportsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/milestone_reports").to route_to("milestone_reports#index")
    end

    it "routes to #new" do
      expect(:get => "/milestone_reports/new").to route_to("milestone_reports#new")
    end

    it "routes to #show" do
      expect(:get => "/milestone_reports/1").to route_to("milestone_reports#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/milestone_reports/1/edit").to route_to("milestone_reports#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/milestone_reports").to route_to("milestone_reports#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/milestone_reports/1").to route_to("milestone_reports#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/milestone_reports/1").to route_to("milestone_reports#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/milestone_reports/1").to route_to("milestone_reports#destroy", :id => "1")
    end
  end
end
