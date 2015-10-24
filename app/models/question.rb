class Question < ActiveRecord::Base
  belongs_to :asker, class_name: :User
  has_many :answers
  has_many :taggings
  has_many :tags, through: :taggings
  has_many :responses, as: :respondable
  has_many :votes, as: :votable

  validates :title, presence: :true, length: { maxium: 500 }, allow_blank: false

  def count_votes
    total = self.votes.sum(:value)
    self.update_attribute(:vote_count, total)
  end

  def sorted_answers
    if best_answer_id
      best_ans = Answer.find(best_answer_id)
      ans_arr = self.answers.select{|ans| ans.id != best_answer_id}
      sort_array_by_points(ans_arr).unshift(best_ans)
    else
      ans_arr = self.answers.dup
      sort_array_by_points(ans_arr)
    end
  end

  def arrayify_title
    title.chomp('?').downcase.split(' ')
  end

  def vote_on_this?(current_user_id)
    !Vote.find_by(voter_id: current_user_id, votable_id: self.id, votable_type: "Question") && current_user_id != self.asker.id
  end

  private

  def sort_array_by_points(ans_arr)
    ans_arr.sort_by{ |ans| ans.vote_count }.reverse
  end
end
