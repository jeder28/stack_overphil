require 'rails_helper'

describe ResponsesController do

  before(:each) do
    @user = User.create(username: "poop", email:"poopy@example.com", password: "yuck")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    @sample_question = @user.questions.create(title: "Blay", content: "yuck")
    @sample_answer = @user.answers.create(content: "yuck", question_id: @sample_question.id)
    @valid_ques_response = @user.responses.create(content: "cool", respondable_id: @sample_question.id, respondable_type: "Question")
    @valid_ans_response = @user.responses.create(content: "cool", respondable_id: @sample_answer.id, respondable_type: "Answer")
  end

  after(:all) do
    @user.destroy
    @sample_answer.destroy
    @sample_question.destroy
    @valid_answ_response.destroy
    @valid_ques_response.destroy
  end

  describe "#new" do
    xit "makes show form to make a new question response" do
      get :new, :question_id => @sample_question.id
      expect(response).to render_template(:new)
    end
  end

  describe "#new" do
    xit "makes show form to make a new answer response" do
      get :new, :answer_id => @sample_answer.id
      expect(response).to render_template(:new)
    end
  end

  describe "#create" do
    it "creates a new response to a question with valid parameters" do
      expect do
        post :create, :question_id => @sample_question.id,  :response => @valid_ques_response.attributes
      end.to change{Response.count}.by(1)
    end
  end

  describe '#create' do
    it "creates a new response to an answer with valid parameters" do
      expect do
        post :create, :answer_id => @sample_answer.id,  :response => @valid_ans_response.attributes
      end.to change{Response.count}.by(1)
    end
  end

end
