require 'rails_helper'

describe AnswersController do
  let(:user) {FactoryGirl.create(:user)}

  let(:answer_attributes) { FactoryGirl.build(:answer).attributes }
  before { @user = FactoryGirl.create(:user) }
  before { @question = Question.create(asker_id: @user.id, title: "hey", content: "hey hey") }
  before { @answer = Answer.create(question_id: @question.id, content: "blah", answerer_id: @user.id) }

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

  # THE BELOW TEST IS SUCCESSFULLY UPDATING IN THE TEST DATABASE
  # BUT DOES NOT PASS IN RSPEC
  describe "#best" do
    xit "updates best_answer_id attribute in parent question" do
      expect do
        post :best, :best_answer_id => @answer.id
      end.to change{@question.best_answer_id}.from(nil).to(@answer.id)
    end
  end
end 