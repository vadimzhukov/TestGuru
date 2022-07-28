class CreateAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :answers do |t|
      t.string :body, null: false
      t.boolean :correct, default: false
      t.references :answers, :questions

      t.timestamps
    end
  end
end
