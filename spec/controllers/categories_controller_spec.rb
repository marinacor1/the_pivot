require 'rails_helper'

describe CategoriesController do
  before do
   @category = Category.create(name: "mobile")
  end

  context "can display categories" do
   it "renders show" do
     get :show, :slug => @category.slug

     expect(response).to render_template :show
     expect(response).to have_http_status :success
   end
  end
end
