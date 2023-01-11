class CreateRules < ActiveRecord::Migration[6.1]
  def change
    create_table :rules do |t|
      t.string :title, null: false
      t.string :parameters
      
      t.timestamps
    end
  end
end
