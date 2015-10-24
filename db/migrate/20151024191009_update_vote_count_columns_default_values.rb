class UpdateVoteCountColumnsDefaultValues < ActiveRecord::Migration
  def change
    change_column_default :responses, :vote_count, from: nil, to: 0
    change_column_default :answers, :vote_count, from: nil, to: 0
    change_column_default :questions, :vote_count, from: nil, to: 0
  end
end
