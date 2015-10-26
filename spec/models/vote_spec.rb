require 'rails_helper'

RSpec.describe Vote, "#increment" do
  before { @question = FactoryGirl.create(:question) }
  before { @answer = FactoryGirl.create(:answer) }
  before { @question_response = FactoryGirl.create(:question_response) }
  before { @answer_response = FactoryGirl.create(:answer_response) }

  let(:question_vote_plus_one) { Vote.new(votable_type: "Question", votable_id: @question.id, voter_id: 1, value: 1) }
  let(:question_vote_minus_one) { Vote.new(votable_type: "Question", votable_id: @question.id, voter_id: 1, value: -1) }
  let(:answer_vote_plus_one) { Vote.new(votable_type: "Answer", votable_id: @answer.id, voter_id: 1, value: 1) }
  let(:answer_vote_minus_one) { Vote.new(votable_type: "Answer", votable_id: @answer.id, voter_id: 1, value: -1) }
  let(:question_response_vote_plus_one) { Vote.new(votable_type: "Response", votable_id: @question_response.id, voter_id: 1, value: 1) }
  let(:question_response_vote_minus_one) { Vote.new(votable_type: "Response", votable_id: @question_response.id, voter_id: 1, value: -1) }
  let(:answer_response_vote_plus_one) { Vote.new(votable_type: "Response", votable_id: @answer_response.id, voter_id: 1, value: 1) }
  let(:answer_response_vote_minus_one) { Vote.new(votable_type: "Response", votable_id: @answer_response.id, voter_id: 1, value: -1) }

  it "should increment the parent question object's vote count by +1" do
    expect { question_vote_plus_one.save }.to change{Question.find(@question.id).vote_count}.from(0).to(1)
  end

  it "should increment the parent question object's vote count by -1" do
    expect { question_vote_minus_one.save }.to change{Question.find(@question.id).vote_count}.from(0).to(-1)
  end

  it "should increment the parent answer object's vote count by +1" do
    expect { answer_vote_plus_one.save }.to change{Answer.find(@answer.id).vote_count}.from(0).to(1)
  end

  it "should increment the parent answer object's vote count by -1" do
     expect { answer_vote_minus_one.save }.to change{Answer.find(@answer.id).vote_count}.from(0).to(-1)
  end

  it "should increment the parent question_response object's vote count by +1" do
    expect { question_response_vote_plus_one.save }.to change{Response.find(@question_response.id).vote_count}.from(0).to(1)
  end

  it "should increment the parent question_response object's vote count by -1" do
    expect { question_response_vote_minus_one.save }.to change{Response.find(@question_response.id).vote_count}.from(0).to(-1)
  end

  it "should increment the parent answer_response object's vote count by +1" do
    expect { answer_response_vote_plus_one.save }.to change{Response.find(@answer_response.id).vote_count}.from(0).to(1)
  end  

  it "should increment the parent answer_response object's vote count by -1" do
    expect { answer_response_vote_minus_one.save }.to change{Response.find(@answer_response.id).vote_count}.from(0).to(-1)
  end  
end
