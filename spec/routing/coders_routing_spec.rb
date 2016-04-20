require 'rails_helper'

describe CodersController do
  describe 'routing' do
    it "routes to #index" do
      expect(get("/coders")).to route_to("coders#index")
    end
  end
end
