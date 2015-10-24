require 'spec_helper'
require 'rails_helper'

feature 'Voting' do
  let(:user) { FactoryGirl.create :user }
  before(:context) do
    @question = FactoryGirl.create :question
  end
  context "on question show page" do
    it "should increment question vote count +1 when upvoting" do
      stub_current_user(user)
      stub_authorize_user!
      visit 'questions/1'
      expect {
        click_button "+1"
      }.to change(Vote, :count).by(1)
      expect(page).to have_content "Vote count: 1"
    end
  end
  context "on question show page" do
    it "should increment question vote count -1 when downvoting" do
      stub_current_user(user)
      stub_authorize_user!
      visit 'questions/1'
      expect {
        click_button "-1"
      }.to change(Vote, :count).by(1)
      expect(page).to have_content "Vote count: -1"
    end
  end
end
