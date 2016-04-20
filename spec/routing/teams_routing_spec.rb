require 'rails_helper'

describe TeamsController do
  describe 'routing' do
    it "routes to #index" do
      expect(get("/teams")).to route_to("teams#index")
    end

    it "routes to #index when clicking a button" do
      expect(post("/teams")).to route_to("teams#create")
    end

    it "routes to #destroy" do
      expect(delete("/teams/1")).to route_to("teams#destroy", :id => "1")
    end
  end
end
