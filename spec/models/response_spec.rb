require 'rails_helper'

RSpec.describe Response, type: :model do

  before(:each) do
    @responder = User.create(username: "feather", email: "feather@example.com", password:"feather")
    @response = @responder.responses.create(content: "I am Grrrreat!", respondable_id: 1, respondable_type: "Question")
    @voter = User.create(username: "Diego", email: "d@example.com", password:"weerd")
  end

  after(:all) do
    @voter.destroy
    @response.destroy
    @responder.destroy
  end

  context '#responder_name' do
    it "should return the username of the responder" do
      expect(@response.responder_name).to eq("feather")
    end
  end

  context '#count_votes' do
    it "should update the vote_count of a response" do
      @response.votes.create(voter_id: @voter.id, value: 5)
      expect{@response.count_votes}.to change{@response.vote_count}.from(0).to(5)
    end
  end

  context '#vote_on_this?' do
    it "should return true if the user didn't create the response and hasn't voted on the response" do
      expect(@response.vote_on_this?(@voter.id)).to be true
    end

    it "should return false if the user already voted on the response" do
      @response.votes.create(voter_id: @voter.id, value: 5)
      expect(@response.vote_on_this?(@voter.id)).to be false
    end
  end

  context '#vote_on_this?' do
    it "should return false if the user created the response" do
      expect(@response.vote_on_this?(@responder.id)).to be false
    end
  end

end
