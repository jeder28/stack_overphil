class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :asker_id
      t.string :title
      t.string :content
      t.integer :best_answer_id

      t.timestamps null: false
    end
  end
end
