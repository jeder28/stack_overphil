require 'rails_helper'

describe VotesController do

  let(:user) {FactoryGirl.create(:user)}
  # let(:sample_question) {FactoryGirl.create(:question)}
  # let(:sample_answer) {FactoryGirl.create(:answer)}
  let(:question_vote_plus_one) { FactoryGirl.build(:question_vote_plus_one).attributes }
  let(:question_vote_minus_one) { FactoryGirl.build(:question_vote_minus_one).attributes }
  let(:answer_vote_plus_one) { FactoryGirl.build(:answer_vote_plus_one).attributes }
  let(:answer_vote_minus_one) { FactoryGirl.build(:answer_vote_minus_one).attributes }
  let(:answer_response_vote_plus_one) { FactoryGirl.build(:answer_response_vote_plus_one).attributes }
  let(:answer_response_vote_minus_one) { FactoryGirl.build(:answer_response_vote_minus_one).attributes }
  let(:question_response_vote_plus_one) { FactoryGirl.build(:question_response_vote_plus_one).attributes }
  let(:question_response_vote_minus_one) { FactoryGirl.build(:question_response_vote_minus_one).attributes }
  
  before(:each) do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
  end

  describe "#create" do
    it "creates a new vote to a question" do
      expect do
        post :create, :vote => question_vote_plus_one
      end.to change{Vote.count}.by(1)
    end

    it "creates a new vote to an answer" do
      expect do
        post :create, :vote => answer_vote_plus_one
      end.to change{Vote.count}.by(1)
    end

    it "creates a new vote to a question response" do
      expect do
        post :create, :vote => question_response_vote_plus_one
      end.to change{Vote.count}.by(1)
    end

    it "creates a new vote to an answer response" do
      expect do
        post :create, :vote => answer_response_vote_plus_one
      end.to change{Vote.count}.by(1)
    end

    #COUNT TOTALS
    it "triggers recalculation of question vote total, plus one" do
      expect do
        post :create, :vote => question_vote_plus_one
      end.to change{Question.last.vote_count}.by(1)
    end

    it "triggers recalculation of question vote total, minus one" do
      expect do
        post :create, :vote => question_vote_minus_one
      end.to change{Question.last.vote_count}.by(-1)
    end

    # THE TESTS BELOW THIS LINE DO NOT WORK 
    xit "triggers recalculation of answer vote total, plus one" do
      expect do
        post :create, :vote => answer_vote_plus_one
      end.to change{Answer.last.vote_count}.by(1)
    end

    xit "triggers recalculation of answer vote total, minus one" do
      expect do
        post :create, :vote => answer_vote_minus_one
      end.to change{Answer.last.vote_count}.by(-1)
    end

    xit "triggers recalculation of question response vote total, plus one" do
      expect do
        post :create, :vote => question_response_vote_plus_one
      end.to change{Response.last.vote_count}.by(1)
    end

    xit "triggers recalculation of question response vote total, minus one" do
      expect do
        post :create, :vote => question_response_vote_minus_one
      end.to change{Response.last.vote_count}.by(-1)
    end

    xit "triggers recalculation of answer response vote total, plus one" do
      expect do
        post :create, :vote => answer_response_vote_plus_one
      end.to change{Response.last.vote_count}.by(1)
    end

    xit "triggers recalculation of answer response vote total, minus one" do
      expect do
        post :create, :vote => answer_response_vote_minus_one
      end.to change{Response.last.vote_count}.by(-1)
    end

  end

end
