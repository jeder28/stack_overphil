require 'rails_helper'

RSpec.describe Question, "#vote_on_this?" do
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

RSpec.describe Question, '#count_votes' do
  before { @user = FactoryGirl.create(:user) }
  before { @user1 = FactoryGirl.create(:user) }
  before { @user2 = FactoryGirl.create(:user) }
  before { @user3 = FactoryGirl.create(:user) }
  before { @question = Question.create(asker_id: @user.id, title: "What?", content: "Por que?") }
  before { @vote1 = Vote.create(votable_id: @question.id, votable_type: 'Question', voter_id: @user1.id, value: 1)}
  before { @vote2 = Vote.create(votable_id: @question.id, votable_type: 'Question', voter_id: @user2.id, value: 1)}
  before { @vote3 = Vote.create(votable_id: @question.id, votable_type: 'Question', voter_id: @user3.id, value: 1)}

  it 'should count the number of votes on a question' do
    expect(@question.count_votes).to eq(true)
    @question.reload
    expect(@question.vote_count).to eq(3)
  end
end

RSpec.describe Question, '.sort_by_votes' do
  before { @question1 = FactoryGirl.create :question }
  before { @question2 = FactoryGirl.create :question }
  before { @question3 = FactoryGirl.create :question }
  before { @question1.update_attributes(:vote_count => 5) }
  before { @question2.update_attributes(:vote_count => 3) }
  before { @question3.update_attributes(:vote_count => 1) }

  it 'should order all questions by order of votes' do
    expect(Question.sort_by_votes.first).to eq(@question1)
    expect(Question.sort_by_votes[1]).to eq(@question2)
    expect(Question.sort_by_votes.last).to eq(@question3)
  end
end

RSpec.describe Question, '.sort_by_trendiness' do
  before { @question1 = FactoryGirl.create :question }
  before { @question2 = FactoryGirl.create :question }
  before { @question3 = FactoryGirl.create :question }
  before { @question1.update_attributes(:view_count => 5) }
  before { @question2.update_attributes(:view_count => 3) }
  before { @question2.update_attributes(:created_at => DateTime.now-7)}
  before { @question1.update_attributes(:created_at => DateTime.now) }
  before { @question3.update_attributes(:created_at => DateTime.now) }
  before { @question3.update_attributes(:view_count => 1) }

  it 'should only consider questions posted within the last week' do
    expect(Question.sort_by_trendiness.length).to eq(2)
  end

  it 'should order the remaining questions by view count' do
    expect(Question.sort_by_trendiness.first).to eq(@question1)
    expect(Question.sort_by_trendiness.last).to eq(@question3)
  end
end

RSpec.describe Question, '.sorted_recentness' do
  before { @question1 = FactoryGirl.create :question }
  before { @question2 = FactoryGirl.create :question }
  before { @question3 = FactoryGirl.create :question }
  before { @question1.update_attributes(created_at: DateTime.now+1) }
  before { @question2.update_attributes(created_at: DateTime.now) }
  before { @question3.update_attributes(created_at: DateTime.now-1) }

  it 'should order questions by order of creation' do
    expect(Question.sort_by_recentness.first).to eq(@question1)
    expect(Question.sort_by_recentness[1]).to eq(@question2)
    expect(Question.sort_by_recentness.last).to eq(@question3)
  end
end

RSpec.describe Question, '#sorted_answers' do
  before { @question = FactoryGirl.create :question }
  before { @answer1 = Answer.create(answerer_id: 1, content: "Bollocks", question_id: @question.id, vote_count: 10)}
  before { @answer2 = Answer.create(answerer_id: 2, content: "Bollocks", question_id: @question.id, vote_count: 5)}
  before { @answer3 = Answer.create(answerer_id: 3, content: "Bollocks", question_id: @question.id, vote_count: 1)}
  before { @answer4 = Answer.create(answerer_id: 4, content: "Bollocks", question_id: @question.id, vote_count: 3)}
  before { @question.update_attributes(:best_answer_id => @answer4.id)}

  it 'should put the best voted answer first' do
    expect(@question.sorted_answers.first).to eq(@question4)
  end

  it 'should afterwards rank the answers by votes' do
    expect(@question.sorted_answers[1]).to eq(@question1)
    expect(@question.sorted_answers[2]).to eq(@question2)
    expect(@question.sorted_answers[3]).to eq(@question3)
  end
end

