10.times { User.create!( username: Faker::Internet.user_name, email: Faker::Internet.email, password:"password" )}

users = User.all

#Make Questions:
users.each do |user|
  5.times { user.questions.create!( title: Faker::Book.title, content: Faker::Lorem.sentence ) }
end

#Make Best Answers

#Make Reg Answers

#Make Comments on Questions

#Make Comments on Answers

#Make Votes on Questions

#Make Votes on Answers

