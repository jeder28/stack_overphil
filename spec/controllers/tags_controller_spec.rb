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
  end
end