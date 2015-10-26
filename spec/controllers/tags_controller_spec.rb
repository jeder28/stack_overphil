require 'rails_helper'

describe TagsController do
      before(:each) do
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
<<<<<<< HEAD
      before(:each) do
      @tag = create(:tag)
      @tag.questions << create(:question)
    end
    
    it "renders show template" do
      get :show, tag.id
=======
    it "renders show template" do
      get :show, {id: 2}
>>>>>>> d10d5660403bbc8d30e220ccd18578eb410f1469
      expect(response).to render_template("show")
    end

    it "assigns tags correctly" do
      get :show, {id: 5}
      expect(assigns(:tag)).to eq(Tag.find(5))
    end
  end
end