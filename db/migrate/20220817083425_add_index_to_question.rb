class AddIndexToQuestion < ActiveRecord::Migration[6.1]
  def change
    add_index :questions, %i[body test_id], unique: true
  end
end
