class Question < ActiveRecord::Base
    belongs_to :user, foreign_key: :asker_id
    has_many :answers
    has_many :tags, through: :taggings
    has_many :responses, as: :respondable
    has_many :votes, as: :votable
end
