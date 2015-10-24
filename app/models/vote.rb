class Vote < ActiveRecord::Base
  after_save :update_parent_vote_total 

  belongs_to :voter, class_name: :User
  belongs_to :votable, polymorphic: true

  def update_parent_vote_total
    if self.votable_type == "Response"
      Response.find(self.votable_id).count_votes
    end
    if self.votable_type == "Answer"
      Answer.find(self.votable_id).count_votes
    end
    if self.votable_type == "Question"
      Question.find(self.votable_id).count_votes
    end
  end
end
