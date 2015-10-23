require 'rails_helper'

RSpec.describe Question, type: :model do
  let(:question) { FactoryGirl.build :question }

  it 'should array-ify a title for searching' do
    question.title = 'Test title AeFt?'
    question.save
    expect(question.arrayify_title).to eq(['test', 'title', 'aeft'])
  end
end
