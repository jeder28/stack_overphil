FactoryGirl.define do
  factory :answer do
    # responder_id 1
    association :responder, factory: :user
    content Faker::Lorem.sentence
    question
    # question_id Question.all.sample.id
    # association :question, factory: :question
  end

end
