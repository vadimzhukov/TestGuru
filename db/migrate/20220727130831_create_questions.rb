class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.string :body, null: false
      t.integer :test_id, null: false

      t.timestamps
    end
    add_foreign_key :questions, :tests
  end
end
