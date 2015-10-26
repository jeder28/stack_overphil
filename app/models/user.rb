class User < ActiveRecord::Base
  has_many :questions, foreign_key: :asker_id
  has_many :answers, foreign_key: :answerer_id
  has_many :votes, foreign_key: :voter_id
  has_many :responses, foreign_key: :responder_id

  has_secure_password
  validates :username, :email, presence: true
  validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
end
