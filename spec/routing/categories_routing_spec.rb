require 'rails_helper'

describe CategoriesController do
  describe 'routing' do
   it "routes to #show" do
     expect(:get => "/data").to route_to("categories#show", {:slug  => "data"})
    end
  end
end
