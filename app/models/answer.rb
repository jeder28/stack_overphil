class Answer < ActiveRecord::Base
  has_many :votes, as: :votable
  has_many :responses, as: :respondable
  belongs_to :question
  belongs_to :answerer, class_name: "User", foreign_key: "answerer_id"

  validates :question, presence: true
  validates :answerer, presence: true
  validates :content, presence: true

  def vote_count
    self.votes.sum(:value)
  end
end
