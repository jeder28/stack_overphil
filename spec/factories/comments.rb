FactoryGirl.define do
  factory :comment do
    content "MyString"
user_id 1
commentable_id 1
commentable_type "MyString"
  end

end
