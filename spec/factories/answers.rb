FactoryGirl.define do
  factory :answer do
    responder_id 1
    content Faker::Lorem.sentence
    question_id Question.all.sample.id
  end

end
