class Answer < ActiveRecord::Base
  has_many :votes, as: :votable
  has_many :responses, as: :respondable
  belongs_to :question
  belongs_to :answerer, class_name: "User", foreign_key: "answerer_id"

  validates :question, presence: true
  validates :answerer, presence: true
  validates :content, presence: true

  def count_votes
    total = self.votes.sum(:value)
    self.update_attribute(:vote_count, total)
  end

  def vote_on_this?(current_user_id)
    !Vote.find_by(voter_id: current_user_id, votable_id: self.id, votable_type: "Answer") && current_user_id != self.answerer.id
  end
end
