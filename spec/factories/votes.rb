FactoryGirl.define do
  factory :question_vote do
    value [1, -1].sample
    user
    question
  end

  factory :answer_vote do
    value [1, -1].sample
    user
    answer
  end

  factory :response_vote do
    value [1, -1].sample
    user
    response
  end

end
