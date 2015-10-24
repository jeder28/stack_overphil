FactoryGirl.define do
  factory :answer do
    # responder_id 1
    association :answerer, factory: :user
    content Faker::Lorem.sentence
    association :question, factory: :question
    # question_id Question.all.sample.id
    # association :question, factory: :question
  end

end
