require 'rails_helper'

describe HomesController do
  context "homepage is displayed" do
    it "renders show" do
      get :show

      expect(response).to render_template :show
      expect(response).to have_http_status :success
    end
  end
end
