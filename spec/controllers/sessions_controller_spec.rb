require 'rails_helper'

describe SessionsController do
  before do
    @user = create(:user)
  end

  context "when logging in" do
    let!(:user) { create(:user) }

    it "renders new" do
      get :new

      expect(response).to render_template :new
      expect(response).to have_http_status :success
    end

    it "creates a user session" do
      post :create, session: { username: @user.username,
                               password: @user.password }

      expect(response).to redirect_to(root_path)
      expect(flash[:message]).to eq("You have successfully logged in!")
    end

    it "redirects when errors on login" do
      post :create, session: {username: @user.username,
                              password: " " }

      expect(response).to render_template :new
      expect(flash[:error]).to eq("login unsuccessful")
    end

    it "destroys a users session" do
      delete :destroy, session: {username: @user.username,
                                 password: @user.password }

      expect(response).to redirect_to root_path
    end
  end

  before do
    @admin = User.create!(admin_user_attributes)
  end

  it "renders admin user page" do
    post :create, session: {username: @admin.username,
                            password: @admin.password }

    expect(response).to redirect_to admin_dashboard_path
    expect(response).to have_http_status :redirect
  end
end
