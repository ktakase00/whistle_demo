require "rails_helper"

RSpec.describe ProjectReportsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/project_reports").to route_to("project_reports#index")
    end

    it "routes to #new" do
      expect(:get => "/project_reports/new").to route_to("project_reports#new")
    end

    it "routes to #show" do
      expect(:get => "/project_reports/1").to route_to("project_reports#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/project_reports/1/edit").to route_to("project_reports#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/project_reports").to route_to("project_reports#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/project_reports/1").to route_to("project_reports#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/project_reports/1").to route_to("project_reports#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/project_reports/1").to route_to("project_reports#destroy", :id => "1")
    end
  end
end
