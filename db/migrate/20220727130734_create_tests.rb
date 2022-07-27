class CreateTests < ActiveRecord::Migration[6.1]
  def change
    create_table :tests do |t|
      t.string :title, null: false 
      t.integer :level, null: false
      t.integer :category_id, null: false
      
      t.timestamps
    end
    add_foreign_key :tests, :categories
    change_column_default :tests, :level, from: nil, to: 0
  end
end
