require 'rails_helper'

describe TagsController do
  before(:each) do
      @tag = create(:tag)
      tag.questions << create(:question)
    end
  end