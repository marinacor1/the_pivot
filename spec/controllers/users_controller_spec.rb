require 'rails_helper'

describe UsersController do
  before do
    @user = create(:user)
  end

  context "when not registered" do
    it "can view new" do
      get :new

      expect(response).to render_template :new
      expect(response).to have_http_status :success
    end
  end

  context "when signed in" do
    it "renders show" do
      get :show, id: @user.id

      expect(response).to render_template :show
      expect(response).to have_http_status :success
    end

    it "redirects to the dashboard upon save" do
      post :create, user: user_attributes

      expect(response).to have_http_status :redirect
      expect(response).to redirect_to dashboard_url
      expect(flash[:message]).to eql("Logged in as #{user_attributes[:name]}")
    end
  end

end
