FactoryGirl.define do
  factory :user do
    username Faker::Internet.user_name
    email Faker::Internet.email
    password_digest Faker::Internet.password
  end
  
  factory :new_user, class: User do
    email  { Faker::Internet.email }
    username  { Faker::Internet.user_name }
    password  { Faker::Internet.password }
  end
end
