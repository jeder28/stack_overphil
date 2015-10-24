FactoryGirl.define do
  factory :answer_response, class: "Response" do
    content Faker::Lorem.sentence
    association :responder, factory: :user
    association :respondable, factory: :answer
  end

  factory :question_response, class: "Response" do
    content Faker::Lorem.sentence
    association :responder, factory: :user
    association :respondable, factory: :question
  end

end
