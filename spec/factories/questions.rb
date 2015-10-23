FactoryGirl.define do
  factory :question do
    asker_id User.all.sample.id
    title Faker::Lorem.sentence
    content Faker::Lorem.paragraph
  end

end
