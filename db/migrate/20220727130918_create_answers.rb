class CreateAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :answers do |t|
      t.string :body, null: false
      t.integer :question_id, null: false
      t.boolean :correct, null: false

      t.timestamps
    end
    add_foreign_key :answers, :questions
    change_column_default(:answers, :correct, from: nil, to: false)
  end
end
