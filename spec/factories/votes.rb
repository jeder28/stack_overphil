FactoryGirl.define do
  factory :vote do
    value [1, -1].sample
    user_id User.all.sample.id
    votable = ['question', 'answer', 'response']
    if votable == 'question'
      votable_id Question.all.sample.id
      votable_type 'Question'
    elsif votable == 'answer'
      votable_id Answer.all.sample.id
      votable_type 'Answer'
    elsif votable == 'response'
      votable_id Response.all.sample.id
      votable_type 'Response'
    end
  end

end
