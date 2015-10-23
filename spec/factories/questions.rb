FactoryGirl.define do
  factory :question do
    # asker_id User.all.sample.id
    association :asker, factory: :user
    title Faker::Lorem.sentence
    content Faker::Lorem.paragraph
  end

end
