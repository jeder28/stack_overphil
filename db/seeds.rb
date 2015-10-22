10.times { User.create!( username: Faker::Internet.user_name, email: Faker::Internet.email, password:"password" )}

users = User.all

#Make Questions:
users.each do |user|
  2.times { user.questions.create!( title: Faker::Book.title, content: Faker::Lorem.sentence ) }
end

#Make Answers
users.each do |user|
  counter_1 = 1
  20.times do
    user.answers.create!( content: Faker::Lorem.sentence, question_id: counter_1)
    counter += 1
  end
end

#Make Best Answers
users.each do |user|
  user.questions.each do |question|
    question.best_answer_id = question.answers.last.id
  end
end

#Make Comments on Questions

users.each do |user|
  user.questions.each do |question|
      5.times { question.responses.create!(content: Faker::Lorem.sentence, responder_id: (rand(10) + 1) ) }
  end
end

#Make Comments on Answers

users.each do |user|
  user.questions.each do |question|
      5.times { question.answers.create!(content: Faker::Lorem.sentence, responder_id: (rand(10) + 1) ) }
  end
end

#Make Votes on Questions

users.each do |user|
vote_counter = 10
  user.questions.each do |question|
    question.votes.create!( value: rand(10)+1, voter_id: vote_counter)
    vote_counter -= 1
  end
end

#Make Votes on Answers

users.each do |user|
vote_counter = 10
  user.answers.each do |answer|
    answer.votes.create!( value: rand(10)+1, voter_id: vote_counter)
    vote_counter -= 1
  end
end