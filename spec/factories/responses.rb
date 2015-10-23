FactoryGirl.define do
  factory :answer_response do
    content Faker::Lorem.sentence
    user
    answer
  end

  factory :question_response do
    content Faker::Lorem.sentence
    user
    question
  end

end
