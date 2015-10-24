class UpdateVoteCountColumnsDefaultValuesAgain < ActiveRecord::Migration
  def change
    change_column_default :responses, :vote_count, 0
    change_column_default :answers, :vote_count, 0
    change_column_default :questions, :vote_count, 0
  end
end
