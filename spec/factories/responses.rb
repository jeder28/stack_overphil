FactoryGirl.define do
  factory :response do
    content Faker::Lorem.sentence
    user_id User.all.sample.id
    respondable = ['questions', 'answers'].sample
    if respondable == 'questions'
      respondable_id Question.all.sample.id
      respondable_type 'Question'
    elsif respondable == 'answers'
      respondable_id Answer.all.sample.id
      respondable_type 'Answer'
    end
  end

end
