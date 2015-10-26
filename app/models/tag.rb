class Tag < ActiveRecord::Base
  has_many :taggings
  has_many :questions, through: :taggings

  def self.make_tags(tags, question)
    tag_array = tags.split(", ")
    tag_array.each do |new_tag|
        old_tag = Tag.find_by(name: new_tag)
        if old_tag
            question.tags.push(old_tag)
        else
            question.tags.create(name: new_tag)
        end
    end
end
end
