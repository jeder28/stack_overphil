require 'rails_helper'

describe QuestionsController do

  let(:user) {FactoryGirl.create(:user)}
  let(:sample_question) {FactoryGirl.create(:question)}
  let(:valid_ques_attrs) { FactoryGirl.build(:question).attributes }
  let(:invalid_ques_attrs) { FactoryGirl.build(:question, title:nil).attributes }
  before(:each) do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    session[:user_id] = user.id
  end

  describe "#new" do
    it "makes show form to make a new question response" do
      get :new, :question_id => sample_question.id
      expect(response).to render_template(:new)
    end
  end

  # describe "#create" do
  #   it "creates a new question with valid parameters" do
  #     expect do
  #       post :create, :question => valid_ques_attrs, :tag => "asdf"
  #     end.to change{Response.count}.by(1)
  #   end
  # end

end
