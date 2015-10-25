require 'rails_helper'

describe VotesController do

  let(:user) {FactoryGirl.create(:user)}
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
  end

end
