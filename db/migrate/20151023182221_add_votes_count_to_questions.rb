class AddVotesCountToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :vote_count, :integer
  end
end
