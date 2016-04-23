require 'rails_helper'

describe TeamsController do

  context "assigns @contents" do
    before do
      @coder = create(:coder)
    end

    it "renders index" do
      get :index

      expect(response).to have_http_status :success
      expect(response).to render_template :index
    end

    it "redirects to coders page upon save" do
      post(:create, {:coder_id => @coder.to_param })

      expect(response).to redirect_to coders_url
    end
  end
end
