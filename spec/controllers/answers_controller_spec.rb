require 'rails_helper'

describe AnswersController do
  let(:user) {FactoryGirl.create(:user)}

  let(:answer_attributes) { FactoryGirl.build(:answer).attributes }
  # let(:answer) { FactoryGirl.create(:answer) }
  # before { @answer = FactoryGirl.create(:answer).attributes }
  before { @user = FactoryGirl.create(:user) }
  before { @question = FactoryGirl.create(:question) }
  before { @answer = Answer.create(question_id: @question.id, content: "blah", answerer_id: @user.id) }
  # before { @answer.question_id = @question.id }

  before(:each) do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
  end
  

  describe "#create" do
    it "creates a new answer" do
      expect do
        post :create, :question_id => @question.id,  :answer => answer_attributes
      end.to change{Answer.count}.by(1)
    end
  end

  describe "#best" do
    it "updates best_answer_id attribute in parent question" do
      puts "THESE TWO NUMBERS SHOULD MATCH:"
      puts @answer.question_id
      puts @question.id
      puts "THIS IS THE BEST ANSWER ID BEFOREHAND:"
      puts @question.best_answer_id
      expect do
        post :best, :best_answer_id => @answer.id
      end.to change{@question.best_answer_id}.from(nil).to(@answer.id)
    end
  end


end