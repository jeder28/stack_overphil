require 'rails_helper'

RSpec.describe Answer, "#vote_on_this?" do
  before { @user1 = FactoryGirl.create(:user) }
  before { @question1 = Question.create(asker_id: @user1.id, title: "hey", content: "hey hey") }
  before { @answer1 = Answer.create(question_id: @question1.id, content: "blah", answerer_id: @user1.id) }
  
  before { @user2 = FactoryGirl.create(:user) }
  before { @vote2 = Vote.create(votable_id: @answer1.id, votable_type: "Answer", voter_id: @user2.id, value: 1) }
  
  before { @user3 = FactoryGirl.create(:user) }
  
  it "should return false if current user is answerer of answer" do
    expect(@answer1.vote_on_this?(@user1.id)).to eq(false)
  end

  it "should return false if current user has already voted on answer" do
    expect(@answer1.vote_on_this?(@user2.id)).to eq(false)
  end

  it "should return true if current user has not yet voted on answer, and is not answerer of answer" do
    expect(@answer1.vote_on_this?(@user3.id)).to eq(true)
  end
end

RSpec.describe Answer, "#is_best_answer?" do
  before { @user1 = FactoryGirl.create(:user) }
  before { @question1 = Question.create(asker_id: @user1.id, title: "hey", content: "hey hey") }
  before { @answer1 = Answer.create(question_id: @question1.id, content: "blah", answerer_id: @user1.id) }
  before { @question1.best_answer_id = @answer1.id }

  before { @answer2 = Answer.create(question_id: @question1.id, content: "blah", answerer_id: @user1.id) }

  it "should return true if answer is the best answer for the given question" do
    expect(@answer1.is_best_answer?(@question1)).to eq(true)
  end

  it "should return false if answer is not the best answer for the given question" do
    expect(@answer2.is_best_answer?(@question1)).to eq(false)
  end

end

RSpec.describe Answer, "#best_answerable?" do
  before { @user1 = FactoryGirl.create(:user) }
  before { @user2 = FactoryGirl.create(:user) }
  before { @question1 = Question.create(asker_id: @user1.id, title: "hey", content: "hey hey") }
  before { @answer1 = Answer.create(question_id: @question1.id, content: "blah", answerer_id: @user2.id) }

  before { @answer2 = Answer.create(question_id: @question1.id, content: "blah", answerer_id: @user1.id) }

  before { @user3 = FactoryGirl.create(:user) }

  before { @question2 = Question.create(asker_id: @user1.id, title: "hey", content: "hey hey") }
  before { @answer3 = Answer.create(question_id: @question2.id, content: "blah", answerer_id: @user2.id) }
  before { @question2.best_answer_id = @answer3.id }
  

  it "should return true if current user is not answerer of answer, and if current user is asker of question, and if question does not yet have a best answer" do
    expect(@answer1.best_answerable?(@question1, @user1.id)).to eq(true)
  end

  it "should return false if current user is answerer of answer" do
    expect(@answer2.best_answerable?(@question1, @user1.id)).to eq(false)
  end

  it "should return false if current user is not asker of question" do
    expect(@answer1.best_answerable?(@question1, @user3.id)).to eq(false)
  end

  it "should return false if question already has a best answer" do
    expect(@answer3.best_answerable?(@question2, @user1.id)).to eq(false)
  end

end