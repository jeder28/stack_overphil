class Question < ActiveRecord::Base
  before_save :count_votes

  belongs_to :asker, class_name: :User
  has_many :answers
  has_many :taggings
  has_many :tags, through: :taggings
  has_many :responses, as: :respondable
  has_many :votes, as: :votable

  validates :title, presence: :true, length: { maxium: 500 }, allow_blank: false

  def arrayify_title
    title.chomp('?').downcase.split(' ')
  end

  def count_votes
    self.vote_count = self.votes.sum(:value)
  end
end
