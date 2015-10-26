require 'rails_helper'

describe TagsController do
      before(:all) do
      @tag = create(:tag)
      @tag.questions << create(:question)
      end

  describe "#index" do
    it "has a 200 status code" do
      get :index
      expect(response.status).to eq(200)
    end

    it "renders index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "#show" do
    it "has a 200 status code" do
      get :show, {id: 2}
      expect(response.status).to eq(200)
    end

    it "renders show template" do
      get :show, {id: 2}
      expect(response).to render_template("show")
    end

    it "assigns tags correctly" do
      get :show, {id: 2}
      expect(assigns(:tag)).to eq(Tag.find(2))
    end
  end
end