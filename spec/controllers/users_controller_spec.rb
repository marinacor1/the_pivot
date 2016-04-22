require 'rails_helper'

describe UsersController do
  before do
    @user = create(:user)
  end

  context "when not registered" do
    it "can view new" do
      get :new

      expect(response).to render_template :new
    end
  end

  context "when signed in" do
    it "renders show" do
      get :show, id: @user.id

      expect(response).to render_template :show
    end
  end
end
