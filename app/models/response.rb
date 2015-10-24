class Response < ActiveRecord::Base
  before_save :count_votes
  
  belongs_to :responder, class_name: :User
  belongs_to :respondable, polymorphic: true
  has_many :votes, as: :votable

  def responder_name
    user = User.find(self.responder_id)
    user.username
  end


  def count_votes
    self.vote_count = self.votes.sum(:value)
  end
end
