class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.string :content, null: false
      t.integer :responder_id, null: false
      t.integer :respondable_id, null: false
      t.string :respondable_type, null: false

      t.timestamps null: false
    end
  end
end
