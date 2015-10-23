class Response < ActiveRecord::Base
  belongs_to :responder, class_name: :User
  belongs_to :respondable, polymorphic: true
  has_many :votes, as: :votable

  def responder_name
    user = User.find(self.responder_id)
    user.username
  end
end
