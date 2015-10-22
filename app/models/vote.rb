class Vote < ActiveRecord::Base
  belongs_to :voter, class_name: :User
  belongs_to :questions, polymorphic: true
  belongs_to :answers, polymorphic: true
end
