class Response < ActiveRecord::Base
  belongs_to :responder, class_name: :User
  belongs_to :respondable, polymorphic: true
end
