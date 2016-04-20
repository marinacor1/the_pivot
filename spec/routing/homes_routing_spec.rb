require 'rails_helper'

describe HomesController do
  describe 'routing' do
    it "routes to #show" do
      expect(get("/homes/1")).to route_to("homes#show", :id => "1")
    end
  end
end

