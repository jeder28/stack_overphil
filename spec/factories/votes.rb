FactoryGirl.define do
  factory :question_vote_plus_one, class: "Vote" do
    value 1
    association :voter, factory: :user
    association :votable, factory: :question
  end

  factory :question_vote_minus_one, class: "Vote" do
    value -1
    association :voter, factory: :user
    association :votable, factory: :question
  end

  factory :answer_vote_plus_one, class: "Vote" do
    value 1
    association :voter, factory: :user
    association :votable, factory: :answer
  end

  factory :answer_vote_minus_one, class: "Vote" do
    value -1
    association :voter, factory: :user
    association :votable, factory: :answer
  end

  factory :answer_response_vote_plus_one, class: "Vote" do
    value 1
    association :voter, factory: :user
    association :votable, factory: :answer_response
  end

  factory :answer_response_vote_minus_one, class: "Vote" do
    value -1
    association :voter, factory: :user
    association :votable, factory: :answer_response
  end

  factory :question_response_vote_plus_one, class: "Vote" do
    value 1
    association :voter, factory: :user
    association :votable, factory: :question_response
  end

  factory :question_response_vote_minus_one, class: "Vote" do
    value -1
    association :voter, factory: :user
    association :votable, factory: :question_response
  end
end
