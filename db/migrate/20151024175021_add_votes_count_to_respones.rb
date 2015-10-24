class AddVotesCountToRespones < ActiveRecord::Migration
  def change
    add_column :responses, :vote_count, :integer
  end
end

