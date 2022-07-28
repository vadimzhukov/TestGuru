class CreateTests < ActiveRecord::Migration[6.1]
  def change
    create_table :tests do |t|
      t.string :titile, null: false
      t.integer :level, null: false, default: 0
      t.references :tables, :categories

      t.timestamps
    end
  end
end
