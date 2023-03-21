require 'rails_helper'

RSpec.describe NewsController, type: :controller do
  describe "#index" do
    it "returns a successful response" do
      get :index
      expect(response).to be_successful
    end

    it "assigns @articles" do
      get :index
      expect(assigns(:articles)).not_to be_nil
    end
  end

  describe "#search" do
    context "with a valid search query" do
      it "returns a successful response" do
        get :search, params: { q: "technology" }
        expect(response).to be_successful
      end

      it "assigns @articles" do
        get :search, params: { q: "technology" }
        expect(assigns(:articles)).not_to be_nil
      end
    end

    context "with an invalid search query" do
      it "redirects to the root path" do
        get :search, params: { q: "" }
        expect(response).to redirect_to(root_path)
      end

      it "sets a flash error message" do
        get :search, params: { q: "" }
        expect(flash[:error]).to be_present
      end
    end
  end
end
