require 'rails_helper'

describe CodersController do
  before do
    @coder = create(:coder)
  end

  context "can display coders" do
    it "renders index of all coders" do
      get :index

      expect(response).to render_template :index
      expect(response).to have_http_status :success
    end

    it "renders individual coder" do
      get :show, id: @coder.id

      expect(response).to render_template :show
      expect(response).to have_http_status :success
    end
  end
end
