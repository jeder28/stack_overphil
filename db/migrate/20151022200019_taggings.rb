class Taggings < ActiveRecord::Migration
  def change
    create_join_table :questions, :tags, table_name: :taggings
  end
end
