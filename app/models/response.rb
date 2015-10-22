class Response < ActiveRecord::Base
  belongs_to :responder, class_name: :User
  belongs_to :questions, polymorphic: true
  belongs_to :answers, polymorphic: true
end
