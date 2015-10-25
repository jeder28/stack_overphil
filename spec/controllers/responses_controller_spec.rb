require 'rails_helper'

describe ResponsesController do

  let(:user) {FactoryGirl.create(:user)}
  let(:sample_question) {FactoryGirl.create(:question)}
  let(:sample_answer) {FactoryGirl.create(:answer)}
  let(:valid_ques_response_attrs) { FactoryGirl.build(:question_response).attributes }
  let(:invalid_ques_response_attrs) { FactoryGirl.build(:question_response, respondable_id:nil).attributes }
  let(:valid_ans_response_attrs) { FactoryGirl.build(:answer_response).attributes }
  let(:invalid_ans_response_attrs) { FactoryGirl.build(:answer_response, respondable_id:nil ).attributes }

  before(:each) do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
  end

  describe "#new" do
    it "makes show form to make a new question response" do
      get :new, :question_id => sample_question.id
      expect(response).to render_template(:new)
    end

    it "makes show form to make a new answer response" do
      get :new, :answer_id => sample_answer.id
      expect(response).to render_template(:new)
    end
  end

  describe "#create" do
    it "creates a new response to a question with valid parameters" do
      expect do
        post :create, :question_id => sample_question.id,  :response => valid_ques_response_attrs
      end.to change{Response.count}.by(1)
    end

    it "creates a new response to an answer with valid parameters" do
      expect do
        post :create, :answer_id => sample_answer.id,  :response => valid_ans_response_attrs
      end.to change{Response.count}.by(1)
    end
  end

end
