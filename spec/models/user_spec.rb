require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:questions).with_foreign_key('asker_id') }
  it { should have_many(:answers).with_foreign_key('answerer_id') }
  it { should have_many(:votes).with_foreign_key('voter_id') }
  it { should have_many(:responses).with_foreign_key('responder_id') }

  it { should validate_presence_of(:password) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:username) }
end
