class AddIndicies < ActiveRecord::Migration
  def change
    add_index :users, :username
  end
end
